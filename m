Return-Path: <linux-media+bounces-47340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 014A6C6CB56
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 05:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 9A5262BAB7
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 04:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A8C2F6901;
	Wed, 19 Nov 2025 04:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Usse05cO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30E02F5A18;
	Wed, 19 Nov 2025 04:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526126; cv=none; b=deXJS5xcxXUBjCkXLRhtCIezHykzvE1nmOnZlYK9ITAgA3CiqjqQRof4BL1Yn1r8TeC/VLXx18qte2hW70O+DmGyBQPElHMwpM6HuT3R7EUQeOuZkJqGvsTRrPAlWX39uUBqyKOH2NzK3eM4aOYw5XxQuikHhIFahGU5RA5M+nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526126; c=relaxed/simple;
	bh=8oaYrKS9uqfDoms+YzLJvGgEnzWNYlBqMYQtdwEmGBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAhO0ifGbZaX5BPHkhDIv1GbzyeEawvLt6YZR0vlCJcwKBvns7xYJB93nE+7wRgORSxBXy2M6Hy9cI8AScbE55YxvLv478HWfopMOSytHt3Mha7DedahmZcy/rccEizV40xEznPhOKEglIBoXv+d5HhaMTHqA1uwZVKLxdZ/QgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Usse05cO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6E875DD9;
	Wed, 19 Nov 2025 05:19:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763525998;
	bh=8oaYrKS9uqfDoms+YzLJvGgEnzWNYlBqMYQtdwEmGBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Usse05cOpEIX92rGj9X8RjDQ203mA9+swA4aeGosQONCUkBws1af3Q7k68APYQQql
	 7IESTlzsgAtdnKY1p2Un6/xqPGSABnpLAbYW8lefmL07aP4+U/N8Sf7XXexjR2uz2F
	 XqEsC+EiopEUp1oWBNlRUftcG2DEO0yKjM0xaJ4A=
Date: Wed, 19 Nov 2025 13:21:26 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Manav Gautama <bandwidthcrunch@gmail.com>,
	Martin Rubli <martin_rubli@logitech.com>
Subject: Re: [PATCH 2/4] media: uvcvideo: Import standard controls from
 uvcdynctrl
Message-ID: <20251119042126.GJ10711@pendragon.ideasonboard.com>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-2-aed70eadf3d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-uvcdynctrl-v1-2-aed70eadf3d8@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Nov 17, 2025 at 08:14:17PM +0000, Ricardo Ribalda wrote:
> The uvcdynctrl tool from libwebcam:
> https://sourceforge.net/projects/libwebcam/
> maps proprietary controls into v4l2 controls using the UVCIOC_CTRL_MAP
> ioctl.
> 
> The tool has not been updated for 10+ years now, and there is no reason
> for the UVC driver to not do the mapping by itself.

I'd expand this a bit for historians:

this was envisioned as the base of a vibrant ecosystem where a large
number of vendors would submit XML files that describe their XU control
mappings, at a pace faster than could be supported by adding XU mappings
to the driver. This vision failed to materialize and the tool has not
been updated for 10+ years now. There is no reason to believe the
situation will change.

> This patch adds the mappings from the uvcdynctrl into the driver. Hopefully
> this effort can help in deprecating the UVCIOC_CTRL_MAP ioctl.
> 
> During the porting, the following mappings where NOT imported because
> they were not using standard v4l2 IDs. It is recommended that userspace
> moves to UVCIOC_CTRL_QUERY for non standard controls.
> 
>         {
>                 .id             = V4L2_CID_FLASH_MODE,
>                 .entity         = UVC_GUID_SIS_LED_HW_CONTROL,
>                 .selector       = 4,
>                 .size           = 4,
>                 .offset         = 0,
>                 .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>                 .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
>                 .menu_mask      = 0x3,
>                 .menu_mapping   = { 0x20, 0x22 },
>                 .menu_names     = { "Off", "On" },
> 
>         },
>         {
>                 .id             = V4L2_CID_FLASH_FREQUENCY,
>                 .entity         = UVC_GUID_SIS_LED_HW_CONTROL,
>                 .selector       = 4,
>                 .size           = 8,
>                 .offset         = 16,
>                 .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
>                 .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
>         },
>        {
>                .id             = V4L2_CID_LED1_MODE,
>                .entity         = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
>                .selector       = 1,
>                .size           = 8,
>                .offset         = 0,
>                .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>                .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
>                .menu_mask      = 0xF,
>                .menu_mapping   = { 0, 1, 2, 3 },
>                .menu_names     = { "Off", "On", "Blinking", "Auto" },
> 
>        },
>        {
>                .id             = V4L2_CID_LED1_FREQUENCY,
>                .entity         = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
>                .selector       = 1,
>                .size           = 8,
>                .offset         = 16,
>                .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
>                .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
>        },
>        {
>                .id             = V4L2_CID_DISABLE_PROCESSING,
>                .entity         = UVC_GUID_LOGITECH_VIDEO_PIPE_V1,
>                .selector       = 5,
>                .size           = 8,
>                .offset         = 0,
>                .v4l2_type      = V4L2_CTRL_TYPE_BOOLEAN,
>                .data_type      = UVC_CTRL_DATA_TYPE_BOOLEAN,
>        },
>        {
>                .id             = V4L2_CID_RAW_BITS_PER_PIXEL,
>                .entity         = UVC_GUID_LOGITECH_VIDEO_PIPE_V1,
>                .selector       = 8,
>                .size           = 8,
>                .offset         = 0,
>                .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
>                .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
>        },
>        {
>                .id             = V4L2_CID_RAW_BITS_PER_PIXEL,
>                .entity         = UVC_GUID_LOGITECH_VIDEO_PIPE_V1,
>                .selector       = 8,
>                .size           = 8,
>                .offset         = 0,
>                .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
>                .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
>        },

Duplicate control.

>        {
>                .id             = V4L2_CID_LED1_MODE,
>                .entity         = UVC_GUID_LOGITECH_PERIPHERAL,
>                .selector       = 0x09,
>                .size           = 2,
>                .offset         = 8,
>                .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>                .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
>                .menu_mask      = 0xF,
>                .menu_mapping   = { 0, 1, 2, 3 },
>                .menu_names     = { "Off", "On", "Blink", "Auto" },
> 
>        },
>        {
>                .id             = V4L2_CID_LED1_FREQUENCY,
>                .entity         = UVC_GUID_LOGITECH_PERIPHERAL,
>                .selector       = 0x09,
>                .size           = 8,
>                .offset         = 24,
>                .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
>                .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
>        },
> 
> This script has been used to generate the mappings. They were then
> reformatted manually to follow the driver style.
> 
> import sys
> import uuid
> import re
> import xml.etree.ElementTree as ET
> 
> def get_namespace(root):
>     return re.match(r"\{.*\}", root.tag).group(0)
> 
> def get_single_guid(ns, constant):
>     id = constant.find(ns + "id").text
>     value = constant.find(ns + "value").text
>     return (id, value)
> 
> def get_constants(ns, root):
>     out = dict()
>     for constant in root.iter(ns + "constant"):
>         attr = constant.attrib
>         if attr["type"] == "integer":
>             id, value = get_single_guid(ns, constant)
>             if id in out:
>                 print(f"dupe constant {id}")
>             out[id] = value
> 
>     return out
> 
> def get_guids(ns, root):
>     out = dict()
>     for constant in root.iter(ns + "constant"):
>         attr = constant.attrib
>         if attr["type"] == "guid":
>             id, value = get_single_guid(ns, constant)
>             if id in out:
>                 print(f"dupe guid {id}")
>             out[id] = value
> 
>     return out
> 
> def get_single_control(ns, control):
>     out = {}
>     for id in "entity", "selector", "index", "size", "description":
>         v = control.find(ns + id)
>         if v is None and id == "description":
>             continue
>         out[id] = v.text
> 
>     reqs = set()
>     for r in control.find(ns + "requests"):
>         reqs.add(r.text)
>     out["requests"] = reqs
> 
>     return (control.attrib["id"], out)
> 
> def get_controls(ns, root):
>     out = dict()
>     for control in root.iter(ns + "control"):
>         id, value = get_single_control(ns, control)
>         if id in out:
>             print(f"Dupe control id {id}")
>         out[id] = value
> 
>     return out
> 
> def get_single_mapping(ns, mapping):
>     out = {}
>     out["name"] = mapping.find(ns + "name").text
>     uvc = mapping.find(ns + "uvc")
>     for id in "size", "offset", "uvc_type":
>         out[id] = uvc.find(ns + id).text
>     out["control_ref"] = uvc.find(ns + "control_ref").attrib["idref"]
> 
>     v4l2 = mapping.find(ns + "v4l2")
>     for id in "id", "v4l2_type":
>         out[id] = v4l2.find(ns + id).text
> 
>     menu = {}
>     for entry in v4l2.iter(ns + "menu_entry"):
>         menu[entry.attrib["name"]] = entry.attrib["value"]
>     if menu:
>         out["menu"] = menu
> 
>     return out
> 
> def get_mapping(ns, root):
>     out = []
>     for control in root.iter(ns + "mapping"):
>         mapping = get_single_mapping(ns, control)
>         out += [mapping]
> 
>     return out
> 
> def print_guids(guids):
>     for g in guids:
>         print(f"#define {g} \\")
>         u_bytes = uuid.UUID(guids[g]).bytes_le
>         u_bytes = [f"0x{b:02x}" for b in u_bytes]
>         print("\t{ " + ", ".join(u_bytes) + " }")
> 
> def print_flags(flags):
>     get_range = {"GET_MIN", "GET_DEF", "GET_MAX", "GET_CUR", "GET_RES"}
>     if get_range.issubset(flags):
>         flags -= get_range
>         flags.add("GET_RANGE")
> 
>     flags = list(flags)
>     flags.sort()
>     out = ""
>     for f in flags[:-1]:
>         out += f"UVC_CTRL_FLAG_{f}\n\t\t\t\t| "
> 
>     out += f"UVC_CTRL_FLAG_{flags[-1]}"
> 
>     return out
> 
> def print_description(desc):
>     print("/*")
>     for line in desc.strip().splitlines():
>         print(f" * {line.strip()}")
>     print("*/")
> 
> def print_controls(controls, cons):
>     for id in controls:
>         c = controls[id]
>         if "description" in c:
>             print_description(c["description"])
>         print(
>             f"""\t{{
> \t\t.entity\t\t= {c["entity"]},
> \t\t.selector\t= {cons[c["selector"]]},
> \t\t.index\t\t= {c["index"]},
> \t\t.size\t\t= {c["size"]},
> \t\t.flags\t\t= {print_flags(c["requests"])},
> \t}},"""
>         )
> 
> def menu_mapping_txt(menu):
>     out = f"\n\t\t.menu_mask\t= 0x{((1<<len(menu))-1):X},\n"
>     out += f"\t\t.menu_mapping\t= {{ {", ".join(menu.values())} }},\n"
>     out += f"\t\t.menu_names\t= {{ \"{"\", \"".join(menu.keys())}\" }},\n"
>     return out
> 
> def print_mappings(mappings, controls, cons):
>     for m in mappings:
>         c = controls[m["control_ref"]]
> 
>         if "menu" in m:
>             menu_mapping = menu_mapping_txt(m["menu"])
>         else:
>             menu_mapping = ""
>         print(
>             f"""\t{{
> \t\t.id\t\t= {m["id"]},
> \t\t.entity\t\t= {c["entity"]},
> \t\t.selector\t= {cons[c["selector"]]},
> \t\t.size\t\t= {m["size"]},
> \t\t.offset\t\t= {m["offset"]},
> \t\t.v4l2_type\t= {m["v4l2_type"]},
> \t\t.data_type\t= {m["uvc_type"]},{menu_mapping}
> \t}},"""
>         )
> 
> def print_code(guids, cons, controls, mappings):
>     used_controls = set()
>     for m in mappings:
>         used_controls.add(m["control_ref"])
> 
>     used_guids = set()
>     for c in used_controls:
>         used_guids.add(controls[c]["entity"])
> 
>     print("\n######GUIDs#######\n")
>     print_guids({id: guids[id] for id in guids if id in used_guids})
>     print("\n######CONTROLS#######\n")
>     print_controls({id: controls[id] for id in controls if id in used_controls}, cons)
>     print("\n######MAPPINGS#######\n")
>     print_mappings(mappings, controls, cons)
>     # print(guids)
>     # print(used_controls)
> 
> root = ET.fromstring(sys.stdin.read())
> ns = get_namespace(root)
> cons = get_constants(ns, root)
> guids = get_guids(ns, root)
> controls = get_controls(ns, root)
> mappings = get_mapping(ns, root)
> print_code(guids, cons, controls, mappings)
> 
> Cc: Manav Gautama <bandwidthcrunch@gmail.com>
> Cc: Martin Rubli <martin_rubli@logitech.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 161 +++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/uvc.h          |   6 ++
>  2 files changed, 167 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 2905505c240c060e5034ea12d33b59d5702f2e1f..5c0398c81334649649ff654f903d03e16381a865 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -385,6 +385,86 @@ static const struct uvc_control_info uvc_ctrls[] = {
>  				| UVC_CTRL_FLAG_GET_RANGE
>  				| UVC_CTRL_FLAG_RESTORE,
>  	},
> +	/*
> +	 * Allows the control of pan/tilt motor movements for camera models
> +	 * that support mechanical pan/tilt.
> +	 *
> +	 * Bits 0 to 15 control pan, bits 16 to 31 control tilt.
> +	 * The unit of the pan/tilt values is 1/64th of a degree and the
> +	 * resolution is 1 degree.
> +	 */
> +	{
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 1,
> +		.index          = 0,
> +		.size           = 4,
> +		.flags          = UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_MIN
> +				| UVC_CTRL_FLAG_SET_CUR,
> +	},
> +	/*
> +	 * Reset the pan/tilt motors to their original position for camera
> +	 * models that support mechanical pan/tilt.
> +	 *
> +	 * Setting bit 0 resets the pan position.
> +	 * Setting bit 1 resets the tilt position.
> +	 *
> +	 * Both bits can be set at the same time to reset both, pan and tilt,
> +	 * at the same time.
> +	 */
> +	{
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 2,
> +		.index          = 1,
> +		.size           = 1,
> +		.flags          = UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_MIN
> +				| UVC_CTRL_FLAG_SET_CUR,
> +	},
> +	/*
> +	 * Allows the control of focus motor movements for camera models that
> +	 * support mechanical focus.
> +	 *
> +	 * Bits 0 to 7 allow selection of the desired lens position.
> +	 * There are no physical units, instead, the focus range is spread over
> +	 * 256 logical units with 0 representing infinity focus and 255 being
> +	 * macro focus.
> +	 */
> +	{
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 3,
> +		.index          = 2,
> +		.size           = 6,
> +		.flags          = UVC_CTRL_FLAG_GET_CUR
> +				| UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_MIN
> +				| UVC_CTRL_FLAG_SET_CUR,
> +	},

A comment would be nice here too. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	{
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 1,
> +		.index          = 0,
> +		.size           = 4,
> +		.flags          = UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_MIN
> +				| UVC_CTRL_FLAG_GET_RES
> +				| UVC_CTRL_FLAG_SET_CUR,
> +	},
> +	{
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 2,
> +		.index          = 1,
> +		.size           = 1,
> +		.flags          = UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_MIN
> +				| UVC_CTRL_FLAG_GET_RES
> +				| UVC_CTRL_FLAG_SET_CUR,
> +	},
>  };
>  
>  static const u32 uvc_control_classes[] = {
> @@ -1009,6 +1089,87 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.menu_mask	= BIT(V4L2_COLORFX_VIVID) |
>  				  BIT(V4L2_COLORFX_NONE),
>  	},
> +	{
> +		.id             = V4L2_CID_PAN_RELATIVE,
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 1,
> +		.size           = 16,
> +		.offset         = 0,
> +		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> +		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_TILT_RELATIVE,
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 1,
> +		.size           = 16,
> +		.offset         = 16,
> +		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> +		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_PAN_RESET,
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 2,
> +		.size           = 1,
> +		.offset         = 0,
> +		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
> +		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_TILT_RESET,
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 2,
> +		.size           = 1,
> +		.offset         = 1,
> +		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
> +		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_PAN_RELATIVE,
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 1,
> +		.size           = 16,
> +		.offset         = 0,
> +		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> +		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_TILT_RELATIVE,
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 1,
> +		.size           = 16,
> +		.offset         = 16,
> +		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> +		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_PAN_RESET,
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 2,
> +		.size           = 1,
> +		.offset         = 0,
> +		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
> +		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_TILT_RESET,
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 2,
> +		.size           = 1,
> +		.offset         = 1,
> +		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
> +		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_FOCUS_ABSOLUTE,
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 3,
> +		.size           = 8,
> +		.offset         = 0,
> +		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> +		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> +	},
>  };
>  
>  /* ------------------------------------------------------------------------
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index 22e0dab0809e296e089940620ae0e8838e109701..b939a01da11466747249c64c72a3ea40cd364a59 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -35,6 +35,12 @@
>  #define UVC_GUID_MSXU_1_5 \
>  	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
>  	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> +#define UVC_GUID_LOGITECH_MOTOR_CONTROL_V1 \
> +	{0x82, 0x06, 0x61, 0x63, 0x70, 0x50, 0xab, 0x49, \
> +	 0xb8, 0xcc, 0xb3, 0x85, 0x5e, 0x8d, 0x22, 0x56 }
> +#define UVC_GUID_LOGITECH_PERIPHERAL \
> +	{0x21, 0x2d, 0xe5, 0xff, 0x30, 0x80, 0x2c, 0x4e, \
> +	 0x82, 0xd9, 0xf5, 0x87, 0xd0, 0x05, 0x40, 0xbd }
>  
>  /* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
>  #define UVC_MSXU_CONTROL_FOCUS			0x01

-- 
Regards,

Laurent Pinchart

