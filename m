Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB392B0620
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 14:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgKLNTV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 08:19:21 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33600 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbgKLNTV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 08:19:21 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id C39691F463D4
Subject: Re: [PATCH v4l-utils 1/1] test-media: Add a python script for rkisp1
 tests
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201110113522.14679-1-dafna.hirschfeld@collabora.com>
 <20201110113522.14679-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <7474843d-61b9-114f-4748-43ef36fd47e2@collabora.com>
Date:   Thu, 12 Nov 2020 10:19:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110113522.14679-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 11/10/20 8:35 AM, Dafna Hirschfeld wrote:
> The script runs tests that configure and streams
> the rkisp1. The script wraps the commands
> provided by v4l-utils and can optionally
> use the 'cam' command from libcamera.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Thanks for this work!

Could you please fix the issues found by pycodestyle tool?

Example:
pycodestyle --show-source --show-pep8 contrib/test/test-rkisp1.py

project page: https://pypi.org/project/pycodestyle/

Also, this is my log.txt http://ix.io/2DTZ

Maybe this could be improved a bit to show which tests suceeded, failed
or have warnings, what do you think?

Thanks
Helen


> ---
>  contrib/test/test-rkisp1.py | 576 ++++++++++++++++++++++++++++++++++++
>  contrib/test/v4l2lib.py     |  90 ++++++
>  2 files changed, 666 insertions(+)
>  create mode 100755 contrib/test/test-rkisp1.py
>  create mode 100644 contrib/test/v4l2lib.py
> 
> diff --git a/contrib/test/test-rkisp1.py b/contrib/test/test-rkisp1.py
> new file mode 100755
> index 00000000..dcdd1ca6
> --- /dev/null
> +++ b/contrib/test/test-rkisp1.py
> @@ -0,0 +1,576 @@
> +#!/bin/env python3
> +
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright 2020 Collabora
> +
> +import argparse
> +import enum
> +import logging
> +import re
> +import subprocess
> +import sys
> +import os
> +import v4l2lib
> +
> +BUS_INFO = "platform:rkisp1"
> +MODULE = "rockchip_isp1"
> +
> +# --------------------------------------------------------
> +# Generic v4l2 functions
> +# --------------------------------------------------------
> +
> +libcamera_dic = {
> +    "YUYV" : "YUYV",
> +    "422P" : None,
> +    "NV16" : "NV16",
> +    "NV61" : "NV61",
> +    "YM61" : None,
> +    "NV21" : "NV21",
> +    "NV12" : "NV12",
> +    "NM21" : None,
> +    "NM12" : None,
> +    "YU12" : None,
> +    "YV12" : None,
> +    "GREY" : "R8"
> +}
> +
> +v4l2_ffmpeg_fmt = {
> +    "422P" : "yuv422p",
> +    "YM24" : "yuv444p",
> +    "YU12" : "yuv420p",
> +    "YV12" : "yuv420p", #this will swap the colors but ffmpeg has no support for yvu
> +    "NV12" : "nv12",
> +    "NV21" : "nv21",
> +    "NM12" : "nv12",
> +    "NM21" : "nv21",
> +# The nv16 does not work on ffplay :(
> +#    "NV16" : "nv16",
> +    "BA24" : "argb",
> +    "GREY" : "gray",
> +    "YUYV" : "yuyv422",
> +    "RGBP" : "rgb565le",
> +    "RGB3" : "rgb24",
> +    "XR24" : "bgr0"
> +}
> +
> +rsz_yuv_fmts = [ "YUYV8_2X8", "YUYV8_1_5X8"]
> +
> +pix_mbus_bayer_map = {
> +'RGGB' : 'SRGGB8_1X8',
> +'GRBG' : 'SGRBG8_1X8',
> +'GBRG' : 'SGBRG8_1X8',
> +'BA81' : 'SBGGR8_1X8',
> +'RG10' : 'SRGGB10_1X10',
> +'BA10' : 'SGRBG10_1X10',
> +'GB10' : 'SGBRG10_1X10',
> +'BG10' : 'SBGGR10_1X10',
> +'RG12' : 'SRGGB12_1X12',
> +'BA12' : 'SGRBG12_1X12',
> +'GB12' : 'SGBRG12_1X12',
> +'BG12' : 'SBGGR12_1X12',
> +}
> +
> +pix_mbus_rsz_map = {
> +    "422P" : "YUYV8_2X8",
> +    "GREY" : "YUYV8_2X8",
> +    "NM12" : "YUYV8_1_5X8",
> +    "NM21" : "YUYV8_1_5X8",
> +    "NV12" : "YUYV8_1_5X8",
> +    "NV16" : "YUYV8_2X8",
> +    "NV21" : "YUYV8_1_5X8",
> +    "NV61" : "YUYV8_2X8",
> +    "RGBP" : "YUYV8_2X8",
> +    "VYUY" : "YUYV8_2X8",
> +    "XR24" : "YUYV8_2X8",
> +    "YM61" : "YUYV8_2X8",
> +    "YU12" : "YUYV8_1_5X8",
> +    "YUYV" : "YUYV8_2X8",
> +    "YV12" : "YUYV8_1_5X8",
> +    "YVYU" : "YUYV8_2X8",
> +}
> +
> +pix_mbus_map = { **pix_mbus_bayer_map, **pix_mbus_rsz_map}
> +
> +# run a shell command.
> +# by default wait for the command to finish and return its output.
> +# if called with wait=False, then run the command and return
> +# immediately. The return value is then the the handle to the subprocess.
> +# the calling function can use it to wait
> +# wait=False is used for simultaneous streaming
> +def run(cmd, wait=True):
> +    logging.debug(" ".join(['"{0}"'.format(x) for x in cmd]))
> +    if wait:
> +        try:
> +            proc = subprocess.run(cmd, capture_output=True, check=True, timeout=10)
> +        except subprocess.CalledProcessError as e:
> +            logging.error(e.stdout.decode('ascii'))
> +            raise
> +        return proc.stdout.decode('ascii')
> +    else:
> +        try:
> +            proc = subprocess.Popen(cmd)
> +        except subprocess.CalledProcessError as e:
> +            logging.error(e.stdout.decode('ascii'))
> +            raise
> +        return proc
> +
> +def find_sensor():
> +    topo = run(["media-ctl", "-d", BUS_INFO, "-p"])
> +    entities = re.findall("^- entity \d+:.*\n", topo, re.MULTILINE)
> +    for ent in entities:
> +        if "rkisp1" not in ent:
> +            sensor = re.search("^- entity \d+: (.+) \(", ent)
> +            sensor = sensor.group(1)
> +            logging.debug("found sensor " + sensor)
> +            return sensor
> +    return None
> +
> +def get_subdev_fmt(entity, pad):
> +    padprop = run(["media-ctl", "-d", BUS_INFO, "--get-v4l2",
> +              '"{entity}":{pad}'.format(entity=entity, pad=pad)])
> +    fmt = re.search("fmt:(.*?)/(\d+)x(\d+)", padprop)
> +    bounds = re.search("crop.bounds:\((\d+),(\d+)\)/(\d+)x(\d+)", padprop)
> +    crop = re.search("crop:\((\d+),(\d+)\)/(\d+)x(\d+)", padprop)
> +    ret = {
> +        "mbus": fmt.group(1),
> +        "size": tuple(map(int, (fmt.group(2), fmt.group(3))))
> +    }
> +    if bounds:
> +        ret["crop_bounds"] = tuple(map(int, bounds.groups()))
> +    if crop:
> +        ret["crop"] = tuple(map(int, crop.groups()))
> +
> +    return ret
> +
> +
> +def set_subdev_fmt(entity, pad, fmt):
> +    curr_fmt = get_subdev_fmt(entity, pad)
> +
> +    if not fmt:
> +        return curr_fmt
> +
> +    logging.debug("set format for {entity}:{pad}".format(entity=entity,pad=pad))
> +    logging.debug("old format: {curr}".format(curr=curr_fmt))
> +
> +    if "size" in fmt:
> +        curr_fmt["size"] = fmt["size"]
> +    if "mbus" in fmt:
> +        curr_fmt["mbus"] = fmt["mbus"]
> +    if "crop" in fmt:
> +            curr_fmt["crop"] = fmt["crop"]
> +            logging.debug("cropping")
> +
> +    # we have no control on the behaviour of the sensor
> +    # the imx219 for example have "crop" as read only
> +    # so we have to delete it, otherwise the media-ctl command fails
> +    if entity == args.sensor:
> +        del(curr_fmt["crop"])
> +    properties = "fmt:{mbus}/{width}x{height}".format(mbus=curr_fmt["mbus"],
> +                                       width=curr_fmt["size"][0],
> +                                       height=curr_fmt["size"][1])
> +    if ("crop" in curr_fmt):
> +        crop = " crop: ({left},{top})/{width}x{height}".format(left=curr_fmt["crop"][0],
> +                           top=curr_fmt["crop"][1],
> +                           width=curr_fmt["crop"][2],
> +                           height=curr_fmt["crop"][3])
> +        properties = properties + crop
> +
> +    run(["media-ctl", "-d", BUS_INFO, "--set-v4l2",
> +        '"{entity}":{pad} [{properties}]'.format(entity=entity,
> +                                                 pad=pad,
> +                                                 properties=properties)])
> +
> +    updated_fmt = get_subdev_fmt(entity, pad)
> +
> +    logging.debug("new format: {new}".format(new=updated_fmt))
> +    return updated_fmt
> +
> +
> +def get_video_fmt(entity):
> +    fmt = run(["v4l2-ctl", "-z", BUS_INFO, "-d", str(entity), "-V"])
> +    size = re.search("(\d+)/(\d+)", fmt)
> +    pixelformat = re.search("'(.*?)'", fmt)
> +    return {
> +        "size": (int(size.group(1)), int(size.group(2))),
> +        "pixelformat": pixelformat.group(1)
> +    }
> +
> +
> +def set_video_fmt(entity, fmt):
> +    properties = ""
> +    if "size" in fmt:
> +        size = "width={width},height={height},".format(width=fmt["size"][0],
> +                                                       height=fmt["size"][1])
> +        properties = properties + size
> +    if "pixelformat" in fmt:
> +        pixfmt = "pixelformat={pixelformat}"
> +        properties = properties + pixfmt.format(pixelformat=fmt["pixelformat"])
> +
> +    run(["v4l2-ctl", "-z", BUS_INFO, "-d", str(entity), "-v", properties])
> +
> +    current_fmt = get_video_fmt(entity)
> +    if (
> +        ("size" in fmt and fmt["size"] != current_fmt["size"]) or
> +        ("pixelformat" in fmt and
> +            fmt["pixelformat"] != current_fmt["pixelformat"])
> +    ):
> +        error_msg = "{entity}: Format couldn't be set. " \
> +                    "Expected {expected}; Got {got}"
> +        raise Exception(error_msg.format(entity=entity, expected=fmt, got=current_fmt))
> +    return current_fmt
> +
> +def disable_links():
> +    run(["media-ctl", "-r"])
> +
> +def get_mbus_codes(entity, pad):
> +    output = run(["v4l2-ctl", "-z", BUS_INFO, "-d", str(entity),
> +                 "--list-subdev-mbus-codes", str(pad)])
> +    return re.findall("MEDIA_BUS_FMT_([^,]+)", output)
> +
> +def get_pixelformats(entity):
> +    output = run(["v4l2-ctl", "-z", BUS_INFO, "-d", str(entity),
> +                  "--list-formats"])
> +    return re.findall("'([A-Z0-9_]*)'", output)
> +
> +def get_expected_file_size(n_frames, entity):
> +    fmt = get_video_fmt(entity)
> +    pix = fmt["pixelformat"]
> +    return int(n_frames) * fmt["size"][0] * fmt["size"][1] * v4l2lib.V4L2_PIX_MUL[pix] / v4l2lib.V4L2_PIX_DIV[pix]
> +
> +def set_file_name_for_stream(entity):
> +    if not args.store:
> +        return None
> +
> +    fmt = get_video_fmt(entity)
> +    out_file = "{out}/stream-{path}-{w}x{h}-{pixfmt}.raw".format(out=args.output,
> +    path=str(entity),
> +    w=fmt["size"][0], h=fmt["size"][1],
> +    pixfmt=fmt["pixelformat"])
> +
> +    if fmt["pixelformat"] in v4l2_ffmpeg_fmt:
> +        ffplay_file = "{out}/ffplay.sh".format(out=args.output)
> +        with open(ffplay_file, "a") as ff:
> +            cmd = "ffplay -f rawvideo -pixel_format {pixfmt} -video_size {w}x{h} {f}\n"
> +            cmd = cmd.format(pixfmt=v4l2_ffmpeg_fmt[fmt["pixelformat"]], w=fmt["size"][0], h=fmt["size"][1],f=out_file)
> +            ff.write(cmd)
> +    return out_file
> +
> +
> +#the wait argument will be False when testing simultaneous streaming
> +def start_stream(entity, out_file=None, wait=True, n_frames = "1"):
> +    stream_cmd = ["v4l2-ctl", "-z", BUS_INFO, "-d", str(entity), "--stream-mmap",
> +           "--stream-count", n_frames]
> +    if out_file:
> +        stream_cmd = stream_cmd + ["--stream-to", out_file]
> +        logging.debug("will capture stream to file {f}".format(f=out_file))
> +
> +    ret = run(stream_cmd,wait=wait)
> +
> +
> +    if args.compliance and wait:
> +        output = run(["v4l2-compliance", "-z", BUS_INFO, "-d", str(entity), "-s", n_frames])
> +        logging.debug(output)
> +    return ret
> +
> +class LimDim(enum.IntEnum):
> +    RSZ_MP_SRC_MAX_WIDTH = 4416
> +    RSZ_MP_SRC_MAX_HEIGHT = 3312
> +    RSZ_SP_SRC_MAX_WIDTH = 1920
> +    RSZ_SP_SRC_MAX_HEIGHT = 1920
> +    RSZ_SRC_MIN_WIDTH = 32
> +    RSZ_SRC_MIN_HEIGHT = 16
> +
> +
> +class Link(enum.IntEnum):
> +    ENABLED = 1
> +    ENABLE = 1
> +    DISABLED = 0
> +    DISABLE = 0
> +
> +class Entities(enum.Enum):
> +    isp = "rkisp1_isp"
> +    resizer_mp = "rkisp1_resizer_mainpath"
> +    resizer_sp = "rkisp1_resizer_selfpath"
> +    cap_mp = "rkisp1_mainpath"
> +    cap_sp = "rkisp1_selfpath"
> +
> +    def __str__(self):
> +        return str(self.value)
> +
> +class IspPads(enum.IntEnum):
> +    SINK_VIDEO = 0,
> +    SINK_PARAMS = 1,
> +    SOURCE_VIDEO = 2,
> +    SOURCE_STATS = 3,
> +
> +    def __str__(self):
> +        return str(self.value)
> +
> +class ResizerPads(enum.IntEnum):
> +    SINK = 0,
> +    SOURCE = 1,
> +
> +def rkisp1_is_link_to_sink_enabled(sink_entity, sink_pad):
> +    topology = run(["media-ctl", "-d", BUS_INFO, "-p"])
> +    pattern = '"{sink_entity}":{sink_pad} \[(.+?)\]'
> +    pattern = pattern.format(sink_entity=sink_entity, sink_pad=sink_pad)
> +    status = re.findall(pattern, topology)
> +    if 'ENABLED' in status or 'ENABLED,IMMUTABLE' in status:
> +        return True
> +    else:
> +        return False
> +
> +def rkisp1_set_link(src_entity, src_pad, sink_entity, sink_pad, is_on=1):
> +    link = "'{src_entity}':{src_pad} -> '{sink_entity}':{sink_pad} [{is_on}]"
> +    link = link.format(src_entity=src_entity,
> +    src_pad=src_pad,
> +    sink_entity=sink_entity,
> +    sink_pad=sink_pad, is_on=is_on)
> +    run(["media-ctl", "-d", BUS_INFO, "-l", link])
> +    is_en = rkisp1_is_link_to_sink_enabled(sink_entity, sink_pad)
> +    if (is_en and not is_on) or (not is_en and is_on):
> +        raise Exception("Couldn't set link {link}".format(link=link))
> +
> +def rkisp1_disable_link(src_entity, src_pad, sink_entity, sink_pad):
> +    rkisp1_set_link(src_entity, src_pad, sink_entity, sink_pad, is_on=0)
> +
> +def rkisp1_enable_link(src_entity, src_pad, sink_entity, sink_pad):
> +    rkisp1_set_link(src_entity, src_pad, sink_entity, sink_pad, is_on=1)
> +
> +def rkisp1_propagate_resizer_fmt(resizer, src_fmt=None):
> +    pfmt = set_subdev_fmt(resizer, ResizerPads.SOURCE, src_fmt)
> +    if resizer == Entities.resizer_sp:
> +        set_video_fmt(Entities.cap_sp, pfmt)
> +    else:
> +        set_video_fmt(Entities.cap_mp, pfmt)
> +
> +# Note, for the isp source format, only the crop can change on the sink pad
> +# since the format should be the same as the sensor
> +# otherwise we get EPIPE
> +# for now we support cropping only in the sink
> +# and the mbus format of the source
> +def rkisp1_propagate_isp_fmt(src_fmt=None, sink_fmt=None):
> +    set_subdev_fmt(Entities.isp, IspPads.SINK_VIDEO, sink_fmt)
> +    pfmt = set_subdev_fmt(Entities.isp, IspPads.SOURCE_VIDEO, src_fmt)
> +    # this settings already include cropping
> +    set_subdev_fmt(Entities.resizer_mp, ResizerPads.SINK, pfmt)
> +    set_subdev_fmt(Entities.resizer_sp, ResizerPads.SINK, pfmt)
> +
> +def rkisp1_propagate_sensor_fmt(src_fmt=None):
> +    pfmt = set_subdev_fmt(args.sensor, 0, src_fmt)
> +    set_subdev_fmt(Entities.isp, IspPads.SINK_VIDEO, pfmt)
> +
> +# Put the driver in a known state
> +def rkisp1_prepare_test():
> +    disable_links()
> +    rkisp1_enable_link(args.sensor, 0, Entities.isp, IspPads.SINK_VIDEO)
> +    rkisp1_enable_link(Entities.isp, IspPads.SOURCE_VIDEO,
> +                       Entities.resizer_mp, ResizerPads.SINK)
> +    rkisp1_enable_link(Entities.isp, IspPads.SOURCE_VIDEO,
> +                       Entities.resizer_sp, ResizerPads.SINK)
> +
> +    rkisp1_propagate_sensor_fmt(src_fmt={"size": (800, 600)})
> +    rkisp1_propagate_isp_fmt(src_fmt={"mbus" : "YUYV8_2X8", "crop": (0,0,800,600)},sink_fmt={"crop" : (0,0,800,600)})
> +    rkisp1_propagate_resizer_fmt(Entities.resizer_mp, src_fmt={"size":(800,600)})
> +    rkisp1_propagate_resizer_fmt(Entities.resizer_sp, src_fmt={"size":(800,600)})
> +    set_video_fmt(Entities.cap_mp, {"pixelformat": "NV12"})
> +    set_video_fmt(Entities.cap_sp, {"pixelformat": "NV12"})
> +    logging.debug("end of test prepare")
> +
> +def test_debugfs():
> +    debugfs_files = [ "outform_size_err", "img_stabilization_size_error", "inform_size_error"]
> +    for dfs in debugfs_files:
> +        dfs_path = "/sys/kernel/debug/rkisp1/" + dfs
> +        with open(dfs_path) as de:
> +            if de.read(1) != '0':
> +                raise Exception("the debugfs file {dfs} indicates an error".format(dfs=dfs_path))
> +
> +
> +# --------------------------------------------------------
> +# rkisp1 tests
> +# --------------------------------------------------------
> +def configure_and_stream(pixelformat, path, isp_dim, resizer_dim):
> +    caps = []
> +    resizers = []
> +
> +    for p in path:
> +        if p == "mainpath":
> +            resizers.append(Entities.resizer_mp)
> +            caps.append(Entities.cap_mp)
> +            other_resizer = Entities.resizer_sp
> +        elif p == "selfpath":
> +            resizers.append(Entities.resizer_sp)
> +            caps.append(Entities.cap_sp)
> +            other_resizer = Entities.resizer_mp
> +        else:
> +            logging.error("bad path value '{path}' only selfpath and mainpath are supported".format(path=path))
> +            return
> +
> +    if len(caps) == 0:
> +        logging.error("at least one path is needed")
> +        return
> +
> +    rkisp1_prepare_test()
> +    if len(caps) == 1:
> +        rkisp1_disable_link(Entities.isp, IspPads.SOURCE_VIDEO,
> +                        other_resizer, ResizerPads.SINK)
> +
> +    sensor_fmt = None
> +    isp_sink_fmt = None
> +    isp_src_fmt = {}
> +    rsz_fmt = None
> +
> +    pix0 = pixelformat[0]
> +    if pix0 in pix_mbus_rsz_map:
> +        isp_src_fmt["mbus"] = "YUYV8_2X8"
> +    elif pix0 in pix_mbus_bayer_map:
> +	    isp_src_fmt["mbus"] = pix_mbus_bayer_map[pix0]
> +    else:
> +        logging.error("bad pixelformat: {p}".format(p=pix0))
> +        return
> +
> +    if isp_dim:
> +         isp_width = re.match("(\d+)x(\d+)", isp_dim).group(1)
> +         isp_height = re.match("(\d+)x(\d+)", isp_dim).group(2)
> +         sensor_fmt={"size" : tuple([isp_width,isp_height])}
> +         isp_sink_fmt={"crop" : tuple([0,0,isp_width,isp_height])}
> +         isp_src_fmt["crop"] = tuple([0,0,isp_width,isp_height])
> +
> +    rkisp1_propagate_sensor_fmt(src_fmt=sensor_fmt)
> +    rkisp1_propagate_isp_fmt(src_fmt=isp_src_fmt, sink_fmt=isp_sink_fmt)
> +
> +    #we first loop the two paths to configure the whole topology
> +    for (resz_dim, pixfmt, cap, resz) in zip(resizer_dim, pixelformat, caps, resizers):
> +
> +        pixfmts = get_pixelformats(cap)
> +
> +        if pixfmt not in pixfmts:
> +            logging.info("given pixelformat {p} is not supported, possible values are:".format(p=pixfmt))
> +            for p in pixfmts:
> +                logging.info(p)
> +            return
> +
> +        rsz_width = re.match("(\d+)x(\d+)", resz_dim).group(1)
> +        rsz_height = re.match("(\d+)x(\d+)", resz_dim).group(2)
> +        rsz_fmt={"size" : tuple([rsz_width,rsz_height])}
> +        rsz_fmt["mbus"] = pix_mbus_map[pixfmt]
> +
> +        rkisp1_propagate_resizer_fmt(resz, src_fmt=rsz_fmt)
> +        set_video_fmt(cap, {"pixelformat": pixfmt})
> +    # after EVERYTHING is configured we start streaming
> +    n_frames = '5' if len(caps) > 1 else '1'
> +    handles = []
> +    out_files = []
> +    for cap in caps:
> +        out_file = set_file_name_for_stream(cap)
> +        handles.append(start_stream(cap, out_file=out_file, wait=(len(caps) == 1), n_frames=n_frames))
> +        if out_file:
> +            out_files.append(out_file)
> +
> +    # if we run both mainpath and selfpath together then wait both of them to finish.
> +    if (len(caps) > 1):
> +        for h in handles:
> +            h.wait()
> +    for (f,cap) in zip(out_files,caps):
> +        file_size = os.path.getsize(f)
> +        expected_size = get_expected_file_size(n_frames, cap)
> +        if (file_size != expected_size):
> +            raise Exception("file size is {fs}, expected size is {es}".format(fs=file_size, es=expected_size))
> +
> +    test_debugfs()
> +
> +def cam_streamer(pixelformat, width, height):
> +
> +    n_frames = '10'
> +    cam_file="{out}/cam-{p}-{w}-{h}.raw".format(out=args.output, p=pixelformat, w=width, h=height)
> +    cam_cmd = ['cam','-c', '1', '--capture=' +  n_frames, '-s', "pixelformat={p},width={w},height={h}".format(p=pixelformat,w=width,h=height)]
> +
> +    if args.store:
> +        cam_file="{out}/cam-{p}-{w}-{h}.raw".format(out=args.output, p=pixelformat, w=width, h=height)
> +        cam_cmd = cam_cmd + ["--file={f}".format(f=cam_file)]
> +        logging.debug("will capture stream to file {f}".format(f=cam_file))
> +
> +    run(cam_cmd)
> +    test_debugfs()
> +
> +def automatic_tests():
> +    fmts = ["YUYV", "422P","NV16","NV61","YM61","NV21","NV12","NM21","NM12","YU12","YV12","GREY" ]
> +
> +
> +    for fmt in fmts:
> +        logging.info("pixel {p}".format(p=fmt))
> +        logging.info("mainpath")
> +        configure_and_stream(pixelformat=[fmt], path=["mainpath"], isp_dim="1920x1080", resizer_dim=["1900x1000"])
> +        logging.info("selfpath")
> +        configure_and_stream(pixelformat=[fmt], path=["selfpath"], isp_dim="1620x1000", resizer_dim=["900x100"])
> +        if args.cam and libcamera_dic[fmt]:
> +            logging.info("cam")
> +            cam_streamer(libcamera_dic[fmt], 1000, 1000)
> +
> +    logging.info("Simultaneous streaming:")
> +
> +    configure_and_stream(pixelformat=["YUYV","NV12"], path=["mainpath","selfpath"], isp_dim="1920x1080", resizer_dim=["1900x1000","800x1100"])
> +    configure_and_stream(pixelformat=["YV12","NV61"], path=["mainpath","selfpath"], isp_dim="1920x1080", resizer_dim=["1900x500","800x700"])
> +
> +if __name__ == "__main__":
> +    rformatter = argparse.RawDescriptionHelpFormatter
> +    parser = argparse.ArgumentParser(formatter_class=rformatter, description='''TL;DR: just run `python3 test-rkisp1.py`.\n
> +    This is a tests script for rkisp1 driver. There are two ways to run the script, either by using
> +    a hardcoded set of tests, or by giving parameters for a custom test (see 'customized test' options).\n
> +    To run a custom test, you should define all the parameters under the 'customized test' section.
> +    If both selfpath and mainpath are given in the '--path' option then the '--pixelformat' and '--resizer-dim'
> +    should also have two values, one for each path.
> +    For example:
> +    Configure selfpath to YUYV,640x480 and mainpath to NV12,800x600:\n
> +    python3 ./test-rkisp1.py -p selfpath mainpath -P YUYV NV12 --isp-dim 640x480 --resizer-dim 640x480 800x600 -S\n
> +    The script was developed for python version 3.7.6 and might not work with other versions.
> +
> +    ''')
> +    parser.add_argument("-v", "--verbose", help="verbose output, logs are printed to stdout and to {outputdir}/log.txt", action="store_true")
> +    parser.add_argument("-s", "--sensor", help="sensor to use. If not given, then the first sensor found is used")
> +    parser.add_argument("-o", "--output", help="directory to add output streams. Default is current directory '.'", default=".")
> +    parser.add_argument("-S", "--store", help="store stream to output folder", action="store_true")
> +    parser.add_argument("-c", "--compliance", help="run compliance tests when streaming", action="store_true")
> +    parser.add_argument("-C", "--cam", help="also run some tests with the 'cam' command from libcamera", action="store_true")
> +    group = parser.add_argument_group('customized test', 'those options are for running specific tests of you own.')
> +    group.add_argument("-P", "--pixelformat", nargs="+", help="the pixelformat(s)")
> +    group.add_argument("-p", "--path", nargs="+", help="the stream path. Allowed values are 'selfpath', 'mainpath'")
> +    group.add_argument("--isp-dim", help="the {width}x{height} of the isp output.")
> +    group.add_argument("--resizer-dim", nargs="+", help="the {width}x{height} of the final image")
> +
> +    args = parser.parse_args()
> +
> +    if args.verbose:
> +        level = logging.DEBUG
> +    else:
> +        level = logging.INFO
> +
> +    logfile = "{output_folder}/log.txt".format(output_folder=args.output)
> +    logging.basicConfig(level=level, filename=logfile, filemode='w')
> +
> +    # define a Handler which writes INFO messages or higher to the sys.stderr
> +    console = logging.StreamHandler()
> +    console.setLevel(level)
> +
> +    # add the handler to the root logger
> +    logging.getLogger('').addHandler(console)
> +
> +    if not args.sensor:
> +        args.sensor = find_sensor()
> +    logging.info("Saving logs at " + logfile)
> +    logging.info("Testing with sensor " + args.sensor)
> +    logging.info("Output directory " + args.output)
> +
> +
> +    # now we parse all the options of the customized tests.
> +    # if all of them are set we run only the customized test
> +    # if none of them are set, we run our tests.
> +    # if only some of them are set we return error
> +    if (args.pixelformat and args.path and args.isp_dim and args.resizer_dim):
> +        configure_and_stream(pixelformat=args.pixelformat, path=args.path, isp_dim=args.isp_dim, resizer_dim=args.resizer_dim)
> +        exit(0)
> +    elif (args.pixelformat or args.path or args.isp_dim or args.resizer_dim):
> +        logging.error("For customized test all customized test options should be given")
> +        exit(1)
> +
> +    automatic_tests()
> diff --git a/contrib/test/v4l2lib.py b/contrib/test/v4l2lib.py
> new file mode 100644
> index 00000000..fdfbf790
> --- /dev/null
> +++ b/contrib/test/v4l2lib.py
> @@ -0,0 +1,90 @@
> +import enum
> +
> +class FmtTypes(enum.IntEnum):
> +    BAYER = 0
> +    YUV = 1
> +    RGB = 2
> +
> +CAP_FORMAT_TYPES = {
> +    "YUYV": FmtTypes.YUV,    # (YUYV 4:2:2)
> +    "YVYU": FmtTypes.YUV,    # (YVYU 4:2:2)
> +    "VYUY": FmtTypes.YUV,    # (VYUY 4:2:2)
> +    "422P": FmtTypes.YUV,    # (Planar YUV 4:2:2)
> +    "NV16": FmtTypes.YUV,    # (Y/CbCr 4:2:2)
> +    "NV61": FmtTypes.YUV,    # (Y/CrCb 4:2:2)
> +    "YM61": FmtTypes.YUV,    # (Planar YVU 4:2:2 (N-C))
> +    "NV21": FmtTypes.YUV,    # (Y/CrCb 4:2:0)
> +    "NV12": FmtTypes.YUV,    # (Y/CbCr 4:2:0)
> +    "NM21": FmtTypes.YUV,    # (Y/CrCb 4:2:0 (N-C))
> +    "NM12": FmtTypes.YUV,    # (Y/CbCr 4:2:0 (N-C))
> +    "YU12": FmtTypes.YUV,    # (Planar YUV 4:2:0)
> +    "YV12": FmtTypes.YUV,    # (Planar YVU 4:2:0)
> +    "YM24": FmtTypes.YUV,    # (Planar YUV 4:4:4 (N-C))
> +    "GREY": FmtTypes.YUV,    # (8-bit Greyscale)
> +    "RGGB": FmtTypes.BAYER,  # (8-bit Bayer RGRG/GBGB)
> +    "GRBG": FmtTypes.BAYER,  # (8-bit Bayer GRGR/BGBG)
> +    "GBRG": FmtTypes.BAYER,  # (8-bit Bayer GBGB/RGRG)
> +    "BA81": FmtTypes.BAYER,  # (8-bit Bayer BGBG/GRGR)
> +    "RG10": FmtTypes.BAYER,  # (10-bit Bayer RGRG/GBGB)
> +    "BA10": FmtTypes.BAYER,  # (10-bit Bayer GRGR/BGBG)
> +    "GB10": FmtTypes.BAYER,  # (10-bit Bayer GBGB/RGRG)
> +    "BG10": FmtTypes.BAYER,  # (10-bit Bayer BGBG/GRGR)
> +    "RG12": FmtTypes.BAYER,  # (12-bit Bayer RGRG/GBGB)
> +    "BA12": FmtTypes.BAYER,  # (12-bit Bayer GRGR/BGBG)
> +    "GB12": FmtTypes.BAYER,  # (12-bit Bayer GBGB/RGRG)
> +    "BG12": FmtTypes.BAYER,  # (12-bit Bayer BGBG/GRGR)
> +    "BGRH" : FmtTypes.RGB,  # (18  BGR-6-6-6), V4L2_PIX_FMT_BGR666
> +    "RGBP" : FmtTypes.RGB, # (16  RGB-5-6-5), V4L2_PIX_FMT_RGB565
> +    "RGB3" : FmtTypes.RGB,  # (24  RGB-8-8-8), V4L2_PIX_FMT_RGB24
> +}
> +
> +ISP_FORMAT_TYPES = {
> +    "YUYV8_2X8": FmtTypes.YUV,
> +    "SRGGB10_1X10": FmtTypes.BAYER,
> +    "SBGGR10_1X10": FmtTypes.BAYER,
> +    "SGBRG10_1X10": FmtTypes.BAYER,
> +    "SGRBG10_1X10": FmtTypes.BAYER,
> +    "SRGGB12_1X12": FmtTypes.BAYER,
> +    "SBGGR12_1X12": FmtTypes.BAYER,
> +    "SGBRG12_1X12": FmtTypes.BAYER,
> +    "SGRBG12_1X12": FmtTypes.BAYER,
> +    "SRGGB8_1X8": FmtTypes.BAYER,
> +    "SBGGR8_1X8": FmtTypes.BAYER,
> +    "SGBRG8_1X8": FmtTypes.BAYER,
> +    "SGRBG8_1X8": FmtTypes.BAYER,
> +    "YUYV8_1X16": FmtTypes.YUV,
> +    "YVYU8_1X16": FmtTypes.YUV,
> +    "UYVY8_1X16": FmtTypes.YUV,
> +    "VYUY8_1X16": FmtTypes.YUV,
> +}
> +
> +V4L2_PIX_MUL = {
> +    "YUYV": 2,
> +    "422P": 2,
> +    "NV16": 2,
> +    "NV61": 2,
> +    "YM61": 2,
> +    "NV21": 3,
> +    "NV12": 3,
> +    "NM21": 3,
> +    "NM12": 3,
> +    "YU12": 3,
> +    "YV12": 3,
> +    "GREY": 1
> +}
> +
> +V4L2_PIX_DIV = {
> +    "YUYV": 1,
> +    "422P": 1,
> +    "NV16": 1,
> +    "NV61": 1,
> +    "YM61": 1,
> +    "NV21": 2,
> +    "NV12": 2,
> +    "NM21": 2,
> +    "NM12": 2,
> +    "YU12": 2,
> +    "YV12": 2,
> +    "GREY": 1
> +}
> +
> 
