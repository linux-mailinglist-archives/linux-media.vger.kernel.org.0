Return-Path: <linux-media+bounces-47229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4A9C66154
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 21:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E4C54E8B14
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 20:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7315433BBC2;
	Mon, 17 Nov 2025 20:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jbfTqVcb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170F33346B3
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 20:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763410463; cv=none; b=OxbC2YWPZYshLMygmPT1VqQRol8KPMPiKuwz4SH8a2rl99aGojnCyZ+n9+akrAX9X4aFhJEo4r+r8OKpWn8EWdwwz+nmRf72rz4pRIXDTsURoYx6O+F4nncciTbU6Ha03ccHeJzv5b6j3f+e9kVnol/T/+Ib9uiZ94e0FHz1yGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763410463; c=relaxed/simple;
	bh=RqpIaG3485hgh4nkz9wTNzcwCeRCjae1qwX6Dg9LUNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VnIFh4xrcwKNfeTYmGkSXRtOn1aaqix5g+YtoWlj6+KaF+ovbZt4mxGQ/EQbEgpnAVOToHFKjXRuY7n2ZLyeZd7dl2xEpnBuFTGal1bNis/eFNjLauqFjrzuNvlKhh3xU7SKEGsMCX8xP8TheS4qh6umISjNFmxR5Gjp3Df+SWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jbfTqVcb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5958232f806so4524078e87.0
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763410459; x=1764015259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QRNsE9fgm4OgsAmIZZxrFGrQZpgm3YVoy5645Fyn2U=;
        b=jbfTqVcbgMXEHNnJAIIYjQA9D3YcmyPCeO0Gvy1JKAf7S+7z6wRbRt0l1xrSt7Z9HF
         BjFXqebgqOgMsQ++SusL90IygaO+iOhwhEAP0xgpFUgSO3HtpoT4+IdTqiDsTbWpnTIs
         btXfreTXxqM+l7hPn0z7XnrQWVSwvOJt4X3WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763410459; x=1764015259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3QRNsE9fgm4OgsAmIZZxrFGrQZpgm3YVoy5645Fyn2U=;
        b=Xe0aiux6wm3JEZzzxlZVHD39C/kv17AG0A9WQkhuDVbIrVaNRl90gBGsD1+xfHH0jF
         4GoKfsrroIwLSVe0+93QxEZuSCDGRqnzGHilED330nedUvER36Ibjp57Qr5VE+kjl1tC
         wkg78BYxgInIoyE2tIoJMSWqOhs2vo+xkCRAfxF3nPruJ1P+JroC0bUnw8F0tygvzgBX
         N4uzwEx2yE7VK53LQOQ00FusnsRZNHZUd9qQHaBngeIovWpjqkrlO40xrnhEb99EHp7P
         aN1RMoCqB3ug8V5BgpYfnHL7jJMM0In8o49y8+FmdjHg/eZe65DMk67PJNR+uSq8OgN3
         IVMQ==
X-Gm-Message-State: AOJu0YxEquFKPDM9gKPbNZYT8vjlgNoi6YN2HBoKsHNLppdMS0NNniYc
	9NJ19GwArpRp37o4sjga5TyZWezuLt2r7O1Zq3EVA0g3nDFB5/Wci+1znOz9cpXH+w==
X-Gm-Gg: ASbGncvSUevblP1HoqAdBSTx+F2DllFPEV/23L6bYPxIYKa+75ZTugADqZwFkVizW4t
	7kUU4wR8kxAa878/dBHxTCPnJtLGNLDmuH8Iut0ijUzRlv5+xpe5WeEe2RrXvAgVvKd2xDdJpiC
	QOJOLD+cEjE3Xe0ASa6qhPEd4NyK7biAGDepoTiqUIuRb4G8wTP6a9C4KMImj9J/o0goKs9JBSD
	1IVL5Y87CqlJ2PXhABZKUofWeF3Fndffyw+nC7SjVwX5FABFcUzwNV8Hm3kwaAv2VStfbD3i536
	AyyjvF0QOOJbXUJLrAwMcrffpJNv/Hg0SU2UH1Ci60psTweXFdiCVFw4JXk8d/xrQCZluHVn7M9
	BYtiWPwbUVoB/g7rhl7/3rGG4B7LCE/4/jpETALSi/vBWKjmqRW51N4umOPJQgMgeXYYF6KO4VC
	IqEtCEbOm3Q82+SvlBdy0U8qualv0WqcZDv9EClsBN/Yhy6XBv99Q=
X-Google-Smtp-Source: AGHT+IH4EcxYDEh5I4nH0gMfxPcsFW4ZrVgmvkzRGCBLNo1Bl/kRZw5LabKokyTQ0QA4Xf2D5if7Uw==
X-Received: by 2002:a05:6512:1599:b0:594:2f46:3912 with SMTP id 2adb3069b0e04-5958423b186mr4264070e87.52.1763410459062;
        Mon, 17 Nov 2025 12:14:19 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003a4sm3413302e87.59.2025.11.17.12.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 12:14:18 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 17 Nov 2025 20:14:17 +0000
Subject: [PATCH 2/4] media: uvcvideo: Import standard controls from
 uvcdynctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-uvcdynctrl-v1-2-aed70eadf3d8@chromium.org>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
In-Reply-To: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Manav Gautama <bandwidthcrunch@gmail.com>, 
 Martin Rubli <martin_rubli@logitech.com>
X-Mailer: b4 0.14.2

The uvcdynctrl tool from libwebcam:
https://sourceforge.net/projects/libwebcam/
maps proprietary controls into v4l2 controls using the UVCIOC_CTRL_MAP
ioctl.

The tool has not been updated for 10+ years now, and there is no reason
for the UVC driver to not do the mapping by itself.

This patch adds the mappings from the uvcdynctrl into the driver. Hopefully
this effort can help in deprecating the UVCIOC_CTRL_MAP ioctl.

During the porting, the following mappings where NOT imported because
they were not using standard v4l2 IDs. It is recommended that userspace
moves to UVCIOC_CTRL_QUERY for non standard controls.

        {
                .id             = V4L2_CID_FLASH_MODE,
                .entity         = UVC_GUID_SIS_LED_HW_CONTROL,
                .selector       = 4,
                .size           = 4,
                .offset         = 0,
                .v4l2_type      = V4L2_CTRL_TYPE_MENU,
                .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
                .menu_mask      = 0x3,
                .menu_mapping   = { 0x20, 0x22 },
                .menu_names     = { "Off", "On" },

        },
        {
                .id             = V4L2_CID_FLASH_FREQUENCY,
                .entity         = UVC_GUID_SIS_LED_HW_CONTROL,
                .selector       = 4,
                .size           = 8,
                .offset         = 16,
                .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
                .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
        },
       {
               .id             = V4L2_CID_LED1_MODE,
               .entity         = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
               .selector       = 1,
               .size           = 8,
               .offset         = 0,
               .v4l2_type      = V4L2_CTRL_TYPE_MENU,
               .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
               .menu_mask      = 0xF,
               .menu_mapping   = { 0, 1, 2, 3 },
               .menu_names     = { "Off", "On", "Blinking", "Auto" },

       },
       {
               .id             = V4L2_CID_LED1_FREQUENCY,
               .entity         = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
               .selector       = 1,
               .size           = 8,
               .offset         = 16,
               .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
               .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
       },
       {
               .id             = V4L2_CID_DISABLE_PROCESSING,
               .entity         = UVC_GUID_LOGITECH_VIDEO_PIPE_V1,
               .selector       = 5,
               .size           = 8,
               .offset         = 0,
               .v4l2_type      = V4L2_CTRL_TYPE_BOOLEAN,
               .data_type      = UVC_CTRL_DATA_TYPE_BOOLEAN,
       },
       {
               .id             = V4L2_CID_RAW_BITS_PER_PIXEL,
               .entity         = UVC_GUID_LOGITECH_VIDEO_PIPE_V1,
               .selector       = 8,
               .size           = 8,
               .offset         = 0,
               .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
               .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
       },
       {
               .id             = V4L2_CID_RAW_BITS_PER_PIXEL,
               .entity         = UVC_GUID_LOGITECH_VIDEO_PIPE_V1,
               .selector       = 8,
               .size           = 8,
               .offset         = 0,
               .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
               .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
       },
       {
               .id             = V4L2_CID_LED1_MODE,
               .entity         = UVC_GUID_LOGITECH_PERIPHERAL,
               .selector       = 0x09,
               .size           = 2,
               .offset         = 8,
               .v4l2_type      = V4L2_CTRL_TYPE_MENU,
               .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
               .menu_mask      = 0xF,
               .menu_mapping   = { 0, 1, 2, 3 },
               .menu_names     = { "Off", "On", "Blink", "Auto" },

       },
       {
               .id             = V4L2_CID_LED1_FREQUENCY,
               .entity         = UVC_GUID_LOGITECH_PERIPHERAL,
               .selector       = 0x09,
               .size           = 8,
               .offset         = 24,
               .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
               .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
       },

This script has been used to generate the mappings. They were then
reformatted manually to follow the driver style.

import sys
import uuid
import re
import xml.etree.ElementTree as ET

def get_namespace(root):
    return re.match(r"\{.*\}", root.tag).group(0)

def get_single_guid(ns, constant):
    id = constant.find(ns + "id").text
    value = constant.find(ns + "value").text
    return (id, value)

def get_constants(ns, root):
    out = dict()
    for constant in root.iter(ns + "constant"):
        attr = constant.attrib
        if attr["type"] == "integer":
            id, value = get_single_guid(ns, constant)
            if id in out:
                print(f"dupe constant {id}")
            out[id] = value

    return out

def get_guids(ns, root):
    out = dict()
    for constant in root.iter(ns + "constant"):
        attr = constant.attrib
        if attr["type"] == "guid":
            id, value = get_single_guid(ns, constant)
            if id in out:
                print(f"dupe guid {id}")
            out[id] = value

    return out

def get_single_control(ns, control):
    out = {}
    for id in "entity", "selector", "index", "size", "description":
        v = control.find(ns + id)
        if v is None and id == "description":
            continue
        out[id] = v.text

    reqs = set()
    for r in control.find(ns + "requests"):
        reqs.add(r.text)
    out["requests"] = reqs

    return (control.attrib["id"], out)

def get_controls(ns, root):
    out = dict()
    for control in root.iter(ns + "control"):
        id, value = get_single_control(ns, control)
        if id in out:
            print(f"Dupe control id {id}")
        out[id] = value

    return out

def get_single_mapping(ns, mapping):
    out = {}
    out["name"] = mapping.find(ns + "name").text
    uvc = mapping.find(ns + "uvc")
    for id in "size", "offset", "uvc_type":
        out[id] = uvc.find(ns + id).text
    out["control_ref"] = uvc.find(ns + "control_ref").attrib["idref"]

    v4l2 = mapping.find(ns + "v4l2")
    for id in "id", "v4l2_type":
        out[id] = v4l2.find(ns + id).text

    menu = {}
    for entry in v4l2.iter(ns + "menu_entry"):
        menu[entry.attrib["name"]] = entry.attrib["value"]
    if menu:
        out["menu"] = menu

    return out

def get_mapping(ns, root):
    out = []
    for control in root.iter(ns + "mapping"):
        mapping = get_single_mapping(ns, control)
        out += [mapping]

    return out

def print_guids(guids):
    for g in guids:
        print(f"#define {g} \\")
        u_bytes = uuid.UUID(guids[g]).bytes_le
        u_bytes = [f"0x{b:02x}" for b in u_bytes]
        print("\t{ " + ", ".join(u_bytes) + " }")

def print_flags(flags):
    get_range = {"GET_MIN", "GET_DEF", "GET_MAX", "GET_CUR", "GET_RES"}
    if get_range.issubset(flags):
        flags -= get_range
        flags.add("GET_RANGE")

    flags = list(flags)
    flags.sort()
    out = ""
    for f in flags[:-1]:
        out += f"UVC_CTRL_FLAG_{f}\n\t\t\t\t| "

    out += f"UVC_CTRL_FLAG_{flags[-1]}"

    return out

def print_description(desc):
    print("/*")
    for line in desc.strip().splitlines():
        print(f" * {line.strip()}")
    print("*/")

def print_controls(controls, cons):
    for id in controls:
        c = controls[id]
        if "description" in c:
            print_description(c["description"])
        print(
            f"""\t{{
\t\t.entity\t\t= {c["entity"]},
\t\t.selector\t= {cons[c["selector"]]},
\t\t.index\t\t= {c["index"]},
\t\t.size\t\t= {c["size"]},
\t\t.flags\t\t= {print_flags(c["requests"])},
\t}},"""
        )

def menu_mapping_txt(menu):
    out = f"\n\t\t.menu_mask\t= 0x{((1<<len(menu))-1):X},\n"
    out += f"\t\t.menu_mapping\t= {{ {", ".join(menu.values())} }},\n"
    out += f"\t\t.menu_names\t= {{ \"{"\", \"".join(menu.keys())}\" }},\n"
    return out

def print_mappings(mappings, controls, cons):
    for m in mappings:
        c = controls[m["control_ref"]]

        if "menu" in m:
            menu_mapping = menu_mapping_txt(m["menu"])
        else:
            menu_mapping = ""
        print(
            f"""\t{{
\t\t.id\t\t= {m["id"]},
\t\t.entity\t\t= {c["entity"]},
\t\t.selector\t= {cons[c["selector"]]},
\t\t.size\t\t= {m["size"]},
\t\t.offset\t\t= {m["offset"]},
\t\t.v4l2_type\t= {m["v4l2_type"]},
\t\t.data_type\t= {m["uvc_type"]},{menu_mapping}
\t}},"""
        )

def print_code(guids, cons, controls, mappings):
    used_controls = set()
    for m in mappings:
        used_controls.add(m["control_ref"])

    used_guids = set()
    for c in used_controls:
        used_guids.add(controls[c]["entity"])

    print("\n######GUIDs#######\n")
    print_guids({id: guids[id] for id in guids if id in used_guids})
    print("\n######CONTROLS#######\n")
    print_controls({id: controls[id] for id in controls if id in used_controls}, cons)
    print("\n######MAPPINGS#######\n")
    print_mappings(mappings, controls, cons)
    # print(guids)
    # print(used_controls)

root = ET.fromstring(sys.stdin.read())
ns = get_namespace(root)
cons = get_constants(ns, root)
guids = get_guids(ns, root)
controls = get_controls(ns, root)
mappings = get_mapping(ns, root)
print_code(guids, cons, controls, mappings)

Cc: Manav Gautama <bandwidthcrunch@gmail.com>
Cc: Martin Rubli <martin_rubli@logitech.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 161 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb/uvc.h          |   6 ++
 2 files changed, 167 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 2905505c240c060e5034ea12d33b59d5702f2e1f..5c0398c81334649649ff654f903d03e16381a865 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -385,6 +385,86 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_GET_RANGE
 				| UVC_CTRL_FLAG_RESTORE,
 	},
+	/*
+	 * Allows the control of pan/tilt motor movements for camera models
+	 * that support mechanical pan/tilt.
+	 *
+	 * Bits 0 to 15 control pan, bits 16 to 31 control tilt.
+	 * The unit of the pan/tilt values is 1/64th of a degree and the
+	 * resolution is 1 degree.
+	 */
+	{
+		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
+		.selector       = 1,
+		.index          = 0,
+		.size           = 4,
+		.flags          = UVC_CTRL_FLAG_GET_DEF
+				| UVC_CTRL_FLAG_GET_MAX
+				| UVC_CTRL_FLAG_GET_MIN
+				| UVC_CTRL_FLAG_SET_CUR,
+	},
+	/*
+	 * Reset the pan/tilt motors to their original position for camera
+	 * models that support mechanical pan/tilt.
+	 *
+	 * Setting bit 0 resets the pan position.
+	 * Setting bit 1 resets the tilt position.
+	 *
+	 * Both bits can be set at the same time to reset both, pan and tilt,
+	 * at the same time.
+	 */
+	{
+		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
+		.selector       = 2,
+		.index          = 1,
+		.size           = 1,
+		.flags          = UVC_CTRL_FLAG_GET_DEF
+				| UVC_CTRL_FLAG_GET_MAX
+				| UVC_CTRL_FLAG_GET_MIN
+				| UVC_CTRL_FLAG_SET_CUR,
+	},
+	/*
+	 * Allows the control of focus motor movements for camera models that
+	 * support mechanical focus.
+	 *
+	 * Bits 0 to 7 allow selection of the desired lens position.
+	 * There are no physical units, instead, the focus range is spread over
+	 * 256 logical units with 0 representing infinity focus and 255 being
+	 * macro focus.
+	 */
+	{
+		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
+		.selector       = 3,
+		.index          = 2,
+		.size           = 6,
+		.flags          = UVC_CTRL_FLAG_GET_CUR
+				| UVC_CTRL_FLAG_GET_DEF
+				| UVC_CTRL_FLAG_GET_MAX
+				| UVC_CTRL_FLAG_GET_MIN
+				| UVC_CTRL_FLAG_SET_CUR,
+	},
+	{
+		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
+		.selector       = 1,
+		.index          = 0,
+		.size           = 4,
+		.flags          = UVC_CTRL_FLAG_GET_DEF
+				| UVC_CTRL_FLAG_GET_MAX
+				| UVC_CTRL_FLAG_GET_MIN
+				| UVC_CTRL_FLAG_GET_RES
+				| UVC_CTRL_FLAG_SET_CUR,
+	},
+	{
+		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
+		.selector       = 2,
+		.index          = 1,
+		.size           = 1,
+		.flags          = UVC_CTRL_FLAG_GET_DEF
+				| UVC_CTRL_FLAG_GET_MAX
+				| UVC_CTRL_FLAG_GET_MIN
+				| UVC_CTRL_FLAG_GET_RES
+				| UVC_CTRL_FLAG_SET_CUR,
+	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -1009,6 +1089,87 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.menu_mask	= BIT(V4L2_COLORFX_VIVID) |
 				  BIT(V4L2_COLORFX_NONE),
 	},
+	{
+		.id             = V4L2_CID_PAN_RELATIVE,
+		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
+		.selector       = 1,
+		.size           = 16,
+		.offset         = 0,
+		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
+		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
+	},
+	{
+		.id             = V4L2_CID_TILT_RELATIVE,
+		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
+		.selector       = 1,
+		.size           = 16,
+		.offset         = 16,
+		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
+		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
+	},
+	{
+		.id             = V4L2_CID_PAN_RESET,
+		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
+		.selector       = 2,
+		.size           = 1,
+		.offset         = 0,
+		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
+		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
+	},
+	{
+		.id             = V4L2_CID_TILT_RESET,
+		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
+		.selector       = 2,
+		.size           = 1,
+		.offset         = 1,
+		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
+		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
+	},
+	{
+		.id             = V4L2_CID_PAN_RELATIVE,
+		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
+		.selector       = 1,
+		.size           = 16,
+		.offset         = 0,
+		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
+		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
+	},
+	{
+		.id             = V4L2_CID_TILT_RELATIVE,
+		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
+		.selector       = 1,
+		.size           = 16,
+		.offset         = 16,
+		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
+		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
+	},
+	{
+		.id             = V4L2_CID_PAN_RESET,
+		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
+		.selector       = 2,
+		.size           = 1,
+		.offset         = 0,
+		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
+		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
+	},
+	{
+		.id             = V4L2_CID_TILT_RESET,
+		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
+		.selector       = 2,
+		.size           = 1,
+		.offset         = 1,
+		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
+		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
+	},
+	{
+		.id             = V4L2_CID_FOCUS_ABSOLUTE,
+		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
+		.selector       = 3,
+		.size           = 8,
+		.offset         = 0,
+		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
+		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
+	},
 };
 
 /* ------------------------------------------------------------------------
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 22e0dab0809e296e089940620ae0e8838e109701..b939a01da11466747249c64c72a3ea40cd364a59 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -35,6 +35,12 @@
 #define UVC_GUID_MSXU_1_5 \
 	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
 	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
+#define UVC_GUID_LOGITECH_MOTOR_CONTROL_V1 \
+	{0x82, 0x06, 0x61, 0x63, 0x70, 0x50, 0xab, 0x49, \
+	 0xb8, 0xcc, 0xb3, 0x85, 0x5e, 0x8d, 0x22, 0x56 }
+#define UVC_GUID_LOGITECH_PERIPHERAL \
+	{0x21, 0x2d, 0xe5, 0xff, 0x30, 0x80, 0x2c, 0x4e, \
+	 0x82, 0xd9, 0xf5, 0x87, 0xd0, 0x05, 0x40, 0xbd }
 
 /* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
 #define UVC_MSXU_CONTROL_FOCUS			0x01

-- 
2.52.0.rc1.455.g30608eb744-goog


