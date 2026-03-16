Return-Path: <linux-media+bounces-55915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPFWGCgIuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:39:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8CF29A984
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38D7430304BB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA5839B484;
	Mon, 16 Mar 2026 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mac0nOBh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AD339902C
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668090; cv=none; b=Gu3/X0Cti+FNK7ohT1TjjHh+TJw+gnw6GaLfD31OXBB7VCAU5iPS7mdz/U0Pg+JXD8jpygXXrAdeVTJ7+NR9VB49KzdY8N1C2Wdtzkylza4nzfWsoD3U7KxAy/QRnCBTnP8AoTnUsXcxhO0AcMYgZk1Ld9vh7aUkeAQfQyEaxt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668090; c=relaxed/simple;
	bh=j3lc1kn/wJoX+9cZrghmGTWwf9ptFSHlpETfxL8/X+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FEcutgbYumMm9BBvsSZwwh/n5+uHgqSCjAuLRKKiws1Nmi0pfgySYx7y4dmob0GEi3uhtEYnODhgrG9y/3ixIVDRxwSsURCc+XOqgh0ayxVrC2JomRaDlMcoS/xVPYuKBVCGtJwTum4X175YgpZf3Q8gye4u9R+okUHS4elFmnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mac0nOBh; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so5255984e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773668087; x=1774272887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DulSoSsXGHcpQnyTZ9WUFnrdzO4ZXeWwNRNkWSs9pxw=;
        b=Mac0nOBheEOqgeYLVD2qN0okA6KPMeUJ+UHcDaxXTTyFDqb9cSEvSLt0D1J2lWXhg2
         fMdQRw4CuVprGQXhw0DVXUJ86HodaraRoaAEZQpB6hIqO547xJ8Hq9nyYVoyrFW+IHMc
         tGNQFYlk3fKbITuM1FGh+RRcyENlFs8MxhfZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668087; x=1774272887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DulSoSsXGHcpQnyTZ9WUFnrdzO4ZXeWwNRNkWSs9pxw=;
        b=jyXPqgBewafTx7Dy7lOBTEHLEI+9Ra7QG5lXhBSKYq9X3dWp+Sv+WbZNOetDeWPJlW
         tx/DNlX/uHH5Kr3Ad9FLRyV/L9twzVCs3LwkCDacsZKG7/zrZGIl4Wq9W4LJ6CsRdEWP
         pmrr4Q070ObJqvFizMigpmxCi0nYpQsrB0Isg8mZsXOsY32kwj5uWHNRAa8yQ+BxxWvJ
         YqDBvI59dhDcZchBUfzbYd16Nx2Lt/17rYVgl4V6EvCpu+2PFBny4v2wPf0gsr0WsNn8
         fO+RqEBG4FkUWdz5npuI4FEg7sl/TpXeTJJar/v5Pxo9dxMBDZKhSzN+lydJRFaphjOP
         niOQ==
X-Gm-Message-State: AOJu0Yzs+a27oEmoc8tRCRNTaalJGyO6vmQkPNKjqPhKDjM0q0vxaJwe
	NoH30LZk1G9uPJXQgdsT4RTFJxyur9U+mugayg5WerWzCC9GP6c4n8irc6cMm7VtZQ==
X-Gm-Gg: ATEYQzxs/jGzx+Min+dPpsQ/DO3jSBivA4kjpdwgsnXu8hldITZbvDwIXNZRbf52aRR
	q1RSkVuLAAG6YWv5Aag3w67E71PbUBLpKse4I3VdXRdNOg34bwNfXUJcK3+3Yi4Vk7BT1k1yJmg
	IgCREF1Q89ukEZHGcaZoYjbCE801omYzydnq9760jtunqYoBs4NYvM3DiaZD3MbcQbDXjbmxtSt
	KiSmJwZ1NApf0680huuzJwu8FGM73S6a3Mkb2QQ36lr11n5qi3ccPhagD8sRj1NhQYyTHbtXfTl
	xltBKdfNd3caFlNiPU+PwLLvI5c0jplxl2Trtm0OeEULSmItMxvgAzTr+NCYVIgVm3uddHbd+BV
	m/WOMnwnKBs5SDpq52Pq7ckaaJ53Lp8lbfXqp+JczDQHIKBtJ39qp9BhmtYBTZayzNCAC9EH18Y
	IloU/XBm8MDydwJKpHc4LyrZ6j8ZvYKyoNjuQ0IL+ElL+vNOwUEk98EgdzqWNXL+N8Ppjo1KrIZ
	Q==
X-Received: by 2002:a05:6512:2c07:b0:5a1:45fc:34f4 with SMTP id 2adb3069b0e04-5a162ae9fc4mr3900183e87.22.1773668087000;
        Mon, 16 Mar 2026 06:34:47 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a7fsm3481473e87.76.2026.03.16.06.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:34:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Mar 2026 13:34:44 +0000
Subject: [PATCH v3 1/4] media: uvcvideo: Import standard controls from
 uvcdynctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-uvcdynctrl-v3-1-19cd4657e1f3@chromium.org>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
In-Reply-To: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Manav Gautama <bandwidthcrunch@gmail.com>, 
 Martin Rubli <martin_rubli@logitech.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55915-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,logitech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CF8CF29A984
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The uvcdynctrl tool from libwebcam:
https://sourceforge.net/projects/libwebcam/
maps proprietary controls into v4l2 controls using the UVCIOC_CTRL_MAP
ioctl.

The tool has not been updated for 10+ years now, and there is no reason
for the UVC driver to not do the mapping by itself.

This patch adds the mappings from the uvcdynctrl into the driver. Hopefully
this effort can help in deprecating the UVCIOC_CTRL_MAP ioctl.

Some background about UVCIOC_CTRL_MAP (thanks Laurent for the context):

```
this was envisioned as the base of a vibrant ecosystem where a large
number of vendors would submit XML files that describe their XU control
mappings, at a pace faster than could be supported by adding XU mappings
to the driver. This vision failed to materialize and the tool has not
been updated for 10+ years now. There is no reason to believe the
situation will change.
```

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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 174 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb/uvc.h          |   6 ++
 2 files changed, 180 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b9a3d9257a11..b6e020b41671 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -385,6 +385,99 @@ static const struct uvc_control_info uvc_ctrls[] = {
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
+	/*
+	 * Allows the control of pan/tilt motor movements for camera models
+	 * that support mechanical pan/tilt.
+	 *
+	 * Bits 0 to 15 control pan, bits 16 to 31 control tilt.
+	 */
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
+	/*
+	 * Reset the pan/tilt motors to their original position for camera
+	 * models that support mechanical pan/tilt.
+	 *
+	 * Setting bit 0 resets the pan position.
+	 * Setting bit 1 resets the tilt position.
+	 */
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
@@ -1009,6 +1102,87 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
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
index ea92ac623a45..dea23aabbad4 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -43,6 +43,12 @@
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
2.53.0.851.ga537e3e6e9-goog


