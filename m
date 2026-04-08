Return-Path: <linux-media+bounces-58203-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MVMMZ/v1Wlc/gcAu9opvQ
	(envelope-from <linux-media+bounces-58203-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 08:03:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A8E3B7698
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 08:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 886AC3014FEB
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 06:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CA435BDDB;
	Wed,  8 Apr 2026 06:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzCCfQw9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C09627702D
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 06:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628181; cv=pass; b=nSQ520YFr0FSgSZMZ5HAOY2UDZ+2AVfouh78s2CGrZqMX3cq2cYjEeI04aWbasgWwt72sB78sYh8TL271Qogt6Sl53x9xurkd85Y8r846s3gLzn1Tb35QPRGcvkGNWwhxM0w3PSvhvg4sQILln77/9SBy86MJ+Dfy5Xq+PqzqGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628181; c=relaxed/simple;
	bh=4Rp1yWM2Lc8IJzSlFv1U5ONIYzlnAwGA7t23LRKNPy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZGHvATPmZ3wGx132g2twym2skoZOFjmkJ90Mpx5iSysdg5E+gLBh83xePgUKN8VnD0y3H2dvq0s/xrhwtBIFjfWIQXko+0iKt3B5wQLXG9m9u5w+VMTzB/p/oirmlZ65FmbTpxLiBMqtvtFjEneQeaC1xILoZa4wA2Bw2d8bFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzCCfQw9; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38df11810abso5669851fa.1
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 23:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775628177; cv=none;
        d=google.com; s=arc-20240605;
        b=fbzyVIPk8dK4rm5N2kjXZt7ErKvapnsQo3SaGWurAvufxsVd03bvIdzeAToNx/zjms
         lkdzhKe1yazf/E8EYYFXlfvFF3HpXouLRNkctI0C4BeZP4gfOWHax4IeLMI20ZhRdsG3
         zaqHquWcdNHXBZLOTvyuxHcXlccH/WBSbvMqFiqxZIXX9LbXrPRpxCEnUq9Db+S5o977
         rn0VxAmRGtgd5i0skqtolyf8jUTkTrdggD5uVFuoUoR+XRAnWAmnzkSazhsTVMMHvllQ
         H1ue0R+5hIHwoIM2NzPhDp3I20guk4n1LftRjo0fb8f2367cR9e6a3rmHsDutYYn6DyQ
         QswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BqpmDm61Kx+DX+fcGqFYDSUTytZ5ZJFRyrUZlOA12OI=;
        fh=iISLtka4G/EbcPcCu8rs+Ai6JJNBNqIQ0jDV70ePDEI=;
        b=dfQ+K3hdxXAb+X066nUlSs2SRbO2MaRz2+xLtkOX0c7QiBBj3E4yTSFbKTbXkpdn6Z
         /sLHtpzHWYISxm24Z3Q4jDpPdmlXM8Mgjt5wkJAIn7sO7LiV6dBVhth5xAti2Wdo5zfH
         s1kbM3jS5Xq/VMTjCkW4QZm3dsE80mGzSRT2pVogAf1vb8Kryy+pQ9oDr4y5CIPO41SM
         lUXijhTltk1PgabNmhSYJb0Fp7TQo9C0z0/Xp+xRWf5/T+lbodJk044jz7e4WKcBW/YB
         vTVnuwxQR/47QLhAgj3z64eZPkLwwxiMM8E00MRY7spEYApeDVbOMtHlbk87Yv7aV7iq
         LRTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775628177; x=1776232977; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BqpmDm61Kx+DX+fcGqFYDSUTytZ5ZJFRyrUZlOA12OI=;
        b=mzCCfQw9eOzSP4dWk8JUIrTjxFcyirfN2TKRbchvRyvfZsc745zz2o5k1Gd+2sU99T
         ThwBqTy5foDaA/838o70e7WpfukOK5v3hnlfUIw/OarV1gqV1jZAlfgw7qXMN38mG/br
         ZdHG+pvD93AJUz7KYTkUjzzO/YaxNwOJGBM5RNb3ZUEsLb6SUrCEtNFGuH5q2C3vnG1W
         LFSvqvtUqQK+wm5EctIq8Soy8Tq4QA/soL/RzT/AlhWtlGSxlIAr4NncAv1q7yNcdeLD
         CRHvUyH1t+mB2ZP2iSzKwENjkXx73KwYKOjN4ncOcr/C2OJ3IKSzstZd9lG9psvR95Pl
         hLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775628177; x=1776232977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqpmDm61Kx+DX+fcGqFYDSUTytZ5ZJFRyrUZlOA12OI=;
        b=OhHnmp6JDJ8nxhOygC8ygfccJkIotBskhleqzQoP9qPX61xWL9yla+HoS/H6EqP6/0
         ijbo80BpsuhyecEk7VsAqcJ+8Vp4fzYqRQZ2+OVXzqnyG+YrYz07/kY2hhfq+NBk2HBu
         WKmVqN0kmCmywR982gyslyfl6UYTo3xoV2umpxKizBmQT/4BYXbM8D3czBnO/ck+Q4I2
         AZQZ6nAUKkx3vcUabswEsVVaxZEjRxSc4hBr6mS/JxQGneY+jeTKCWLSOCEnmJfbFIVZ
         MpvP91+nipXufyo089snJF3Y6SxdmDgDsQhZkfskg9dHAY/CRa8dp5i/gUbbamq81Ifn
         AeKw==
X-Forwarded-Encrypted: i=1; AJvYcCVZIatgiEZleBDct0HgcYYki1kRoXiQ3nt1TYds93MzI3b7TcqL3kWuzOwJ4UzJGzCOlN3M12RSfnB1AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzAwo0UPEircyRkWlq+k0RQMUhl2oIv2WGp2Td8cyn3rPVukYc
	344i+2ZtyIPw+y7L2cOzhxhCwYocfM2IcbsKFaowLR8bS/TVnxA+tP9QkkkvWBEh3/LlsaeYiqm
	FJro5DUf1E7ky4UVsdXpOTAHavwg+JAc=
X-Gm-Gg: AeBDieuyC8CgRPqQs5iThIgCv1h5IaHgKs3rQ4uOuNaV9+0VH1DdhzRTA/F4jznUt2I
	6qE2TeMRP2yd+v/byKeE4WfcBFNB09a+ATlQP65xLQDxk3wsngUwSpIDZ/xK2VZIl3iXmOF1/3f
	DbiExjhgSzU8tAQPYNKCxdX9b6sf1DCS85E/j8XRx+NMNPQqrVmdVvr3piCmF3Cc2erY8LK9Quw
	XRydR0nXEDcqXiXaJ1mqyyN65Z6jPc7Z7xcqlZIniE9+F7o1OG3/X6GbVFACnNR6f2Rio8w4ktW
	tYFqs3StIyQSuUhYM2czLddTErAZ+J4IpD0BWyPbiU/WTUWWAHGgsXJ7sVvT+jC58/UsRI/sht3
	rs9q7/enphOXgmIHxBJSQkbEi/w==
X-Received: by 2002:a2e:b0e6:0:b0:387:b72:816a with SMTP id
 38308e7fff4ca-38cd6a7bf90mr49367331fa.3.1775628176931; Tue, 07 Apr 2026
 23:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190145.11592-1-lukaslarson@gmail.com> <ac6btfUsok-Y0Dw2@kekkonen.localdomain>
 <CAMCiyfoVxS_iQWVEiak+mv1i9uF2WtqMqyfCgeQyO_q5XS4LgA@mail.gmail.com> <adT5gpw-DjHAEUuB@kekkonen.localdomain>
In-Reply-To: <adT5gpw-DjHAEUuB@kekkonen.localdomain>
From: Lukas Larson <lukaslarson@gmail.com>
Date: Wed, 8 Apr 2026 08:02:44 +0200
X-Gm-Features: AQROBzCFuwexki5cEZ4Ucu6JzeQxYh812j7EwvMJ4Nzz8U8Ia6kdxvu4zx35AnU
Message-ID: <CAMCiyfog4ViGYFOOpzMDHB9w=Trs1YOr1DMyNDixYEMVZri=Bg@mail.gmail.com>
Subject: Re: [PATCH] media: ipu-bridge: Add upside-down sensor quirk for Dell
 16 Premium DA16250
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org, 
	johannes.goede@oss.qualcomm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58203-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukaslarson@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 75A8E3B7698
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On pld 6.19 the camera powered on, but the image was flipped upside down.
Tested adding https://github.com/intel/ipu6-camera-bins and
https://github.com/intel/ipu6-drivers, still upside down.

Some logs from pld:
cam -l
[0:03:57.172445296] [3436]  INFO Camera camera_manager.cpp:340 libcamera v0.7.0
[0:03:57.182450990] [3437] ERROR V4L2 v4l2_subdevice.cpp:1192 'ov02c10
21-0036': Unable to get rectangle 2 on pad 0/0: Inappro
priate ioctl for device
[0:03:57.182463100] [3437]  WARN CameraSensor
camera_sensor_legacy.cpp:402 'ov02c10 21-0036': The PixelArraySize
property has
been defaulted to 1928x1092
[0:03:57.182465943] [3437] ERROR V4L2 v4l2_subdevice.cpp:1192 'ov02c10
21-0036': Unable to get rectangle 1 on pad 0/0: Inappro
priate ioctl for device
[0:03:57.182467749] [3437]  WARN CameraSensor
camera_sensor_legacy.cpp:413 'ov02c10 21-0036': The
PixelArrayActiveAreas proper
ty has been defaulted to (0, 0)/1928x1092
[0:03:57.182470246] [3437] ERROR V4L2 v4l2_subdevice.cpp:1192 'ov02c10
21-0036': Unable to get rectangle 0 on pad 0/0: Inappro
priate ioctl for device
[0:03:57.182471832] [3437]  WARN CameraSensor
camera_sensor_legacy.cpp:421 'ov02c10 21-0036': Failed to retrieve the
sensor cr
op rectangle
[0:03:57.182473078] [3437]  WARN CameraSensor
camera_sensor_legacy.cpp:427 'ov02c10 21-0036': The sensor kernel
driver needs t
o be fixed
[0:03:57.182474331] [3437]  WARN CameraSensor
camera_sensor_legacy.cpp:429 'ov02c10 21-0036': See
Documentation/sensor_driver_
requirements.rst in the libcamera sources for more information
[0:03:57.182546924] [3437]  WARN CameraSensorProperties
camera_sensor_properties.cpp:538 No static properties available for 'o
v02c10'
[0:03:57.182551521] [3437]  WARN CameraSensorProperties
camera_sensor_properties.cpp:540 Please consider updating the camera s
ensor properties database
[0:03:57.182554540] [3437]  WARN CameraSensor
camera_sensor_legacy.cpp:502 'ov02c10 21-0036': No sensor delays found
in static
properties. Assuming unverified defaults.
[0:03:57.191258326] [3437]  WARN IPAProxy ipa_proxy.cpp:192
Configuration file 'ov02c10.yaml' not found for IPA module 'simple
', falling back to '/usr/share/libcamera/ipa/simple/uncalibrated.yaml'
[0:03:57.191277124] [3437] ERROR V4L2 v4l2_subdevice.cpp:1192 'ov02c10
21-0036': Unable to get rectangle 0 on pad 0/0: Inappro
priate ioctl for device
[0:03:57.191281543] [3437]  WARN CameraSensor
camera_sensor_legacy.cpp:881 'ov02c10 21-0036': The analogue crop
rectangle has
been defaulted to the active area size
[0:03:57.191291694] [3437]  WARN IPASoft soft_simple.cpp:104 IPASoft:
Failed to create camera sensor helper for ov02c10
[0:03:57.191397279] [3437]  INFO Camera camera_manager.cpp:223 Adding
camera '\_SB_.PC00.LNK1' for pipeline handler simple
Available cameras:
1: External camera 'ov02c10' (\_SB_.PC00.LNK1)

qcam
[0:04:08.229742046] [3443]  INFO Camera camera_manager.cpp:340 libcamera v0.7.0
[0:04:08.239552370] [3454] ERROR V4L2 v4l2_subdevice.cpp:1192 'ov02c10
21-0036': Unable to get rectangle 2 on pad 0/0: Inappro
priate ioctl for device
[0:04:08.239566225] [3454]  WARN CameraSensor
camera_sensor_legacy.cpp:402 'ov02c10 21-0036': The PixelArraySize
property has
been defaulted to 1928x1092
[0:04:08.239569234] [3454] ERROR V4L2 v4l2_subdevice.cpp:1192 'ov02c10
21-0036': Unable to get rectangle 1 on pad 0/0: Inappro
priate ioctl for device
[0:04:08.239571547] [3454]  WARN CameraSensor
camera_sensor_legacy.cpp:413 'ov02c10 21-0036': The
PixelArrayActiveAreas proper
ty has been defaulted to (0, 0)/1928x1092
[0:04:08.239574007] [3454] ERROR V4L2 v4l2_subdevice.cpp:1192 'ov02c10
21-0036': Unable to get rectangle 0 on pad 0/0: Inappro
priate ioctl for device
[0:04:08.239575842] [3454]  WARN CameraSensor
camera_sensor_legacy.cpp:421 'ov02c10 21-0036': Failed to retrieve the
sensor cr
op rectangle
[0:04:08.239577195] [3454]  WARN CameraSensor
camera_sensor_legacy.cpp:427 'ov02c10 21-0036': The sensor kernel
driver needs t
o be fixed
[0:04:08.239578598] [3454]  WARN CameraSensor
camera_sensor_legacy.cpp:429 'ov02c10 21-0036': See
Documentation/sensor_driver_
requirements.rst in the libcamera sources for more information
[0:04:08.239652341] [3454]  WARN CameraSensorProperties
camera_sensor_properties.cpp:538 No static properties available for 'o
v02c10'
[0:04:08.239655770] [3454]  WARN CameraSensorProperties
camera_sensor_properties.cpp:540 Please consider updating the camera s
ensor properties database
[0:04:08.239659621] [3454]  WARN CameraSensor
camera_sensor_legacy.cpp:502 'ov02c10 21-0036': No sensor delays found
in static
properties. Assuming unverified defaults.
[0:04:08.248493543] [3454]  WARN IPAProxy ipa_proxy.cpp:192
Configuration file 'ov02c10.yaml' not found for IPA module 'simple
', falling back to '/usr/share/libcamera/ipa/simple/uncalibrated.yaml'
[0:04:08.248514916] [3454] ERROR V4L2 v4l2_subdevice.cpp:1192 'ov02c10
21-0036': Unable to get rectangle 0 on pad 0/0: Inappro
priate ioctl for device
[0:04:08.248520342] [3454]  WARN CameraSensor
camera_sensor_legacy.cpp:881 'ov02c10 21-0036': The analogue crop
rectangle has
been defaulted to the active area size
[0:04:08.248535573] [3454]  WARN IPASoft soft_simple.cpp:104 IPASoft:
Failed to create camera sensor helper for ov02c10
[0:04:08.248669436] [3454]  INFO Camera camera_manager.cpp:223 Adding
camera '\_SB_.PC00.LNK1' for pipeline handler simple
[0:04:08.266367143] [3443]  INFO Camera camera.cpp:1215 configuring
streams: (0) 1920x1092-ABGR8888/sRGB
[0:04:08.266483080] [3454]  INFO IPASoft soft_simple.cpp:258 IPASoft:
Exposure 4-2320, gain 16-248 (1)
Zero-copy enabled
MESA: error: ZINK: vkCreateInstance failed (VK_ERROR_INCOMPATIBLE_DRIVER)
libEGL warning: egl: failed to create dri2 screen
libEGL warning: DRI2: failed to create screen
[0:04:10.776690674] [3456]  INFO eGL egl.cpp:305 EGL: EGL_VERSION: 1.5
[0:04:10.776721706] [3456]  INFO eGL egl.cpp:306 EGL: EGL_VENDOR: Mesa Project
[0:04:10.776727746] [3456]  INFO eGL egl.cpp:307 EGL: EGL_CLIENT_APIS:
OpenGL OpenGL_ES
[0:04:10.776732346] [3456]  INFO eGL egl.cpp:308 EGL: EGL_EXTENSIONS:
EGL_ANDROID_blob_cache EGL_ANDROID_native_fence_sync EGL
_EXT_config_select_group EGL_EXT_create_context_robustness
EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers
EGL_EXT_protected_content EGL_EXT_query_reset_notification_strategy
EGL_EXT_surface_compression EGL_IMG_context_priority EGL_
KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_context_flush_control
EGL_KHR_create_context EGL_KHR_create_context_no_error EGL_
KHR_fence_sync EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace
EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image
EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image
EGL_KHR_image_base EGL_KHR_no_config_context EGL_KHR_partial_upda
te EGL_KHR_reusable_sync EGL_KHR_surfaceless_context
EGL_EXT_pixel_format_float EGL_KHR_wait_sync
EGL_MESA_configless_context
EGL_MESA_gl_interop EGL_MESA_image_dma_buf_export
EGL_MESA_query_driver EGL_MESA_x11_native_visual_id
[0:04:10.779627096] [3456]  INFO eGL egl.cpp:349 EGL: GL_VERSION:
OpenGL ES 3.2 Mesa 26.0.4-arch1.1
[0:04:13.015244935] [3456]  INFO Benchmark benchmark.cpp:83 Processed
30 frames in 151023us, 5034 us/frame

Applied
+       acpi_handle_warn(acpi_device_handle(adev),
+                        "on sailus pld 6.19, ssdb degree %d \n",
+                 ssdb->degree);
+

sudo dmesg | grep -e sailus -e ovti -e ov02c1 -e ipu -e PLD -e orientation
[    6.010337] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
[    6.014964] ACPI: \_SB_.PC00.LNK1: on sailus pld 6.19, ssdb degree 0
[    6.016208] ACPI: \_SB_.PC00.LNK1: Using default orientation
[    6.016366] intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
[    6.016432] intel-ipu6 0000:00:05.0: Connected 1 cameras
[    6.017342] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
[    6.018354] ov02c10 i2c-OVTI02C1:00: supply dovdd not found, using
dummy regulator
[    6.018395] ov02c10 i2c-OVTI02C1:00: supply avdd not found, using
dummy regulator
[    6.018400] ov02c10 i2c-OVTI02C1:00: supply dvdd not found, using
dummy regulator
[    6.061002] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[    6.109029] intel-ipu6 0000:00:05.0: CSE authenticate_run done
[    6.109036] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6

Did not see the "_PLD exists; not use rotation".

After adding the DA16250 explicitly the camera was the correct orientation.

static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
+       {
+               .matches = {
+                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 16
Premium DA16250"),
+               },
+               .driver_data = "OVTI02C1",
+       },

--
Best Regards,
Lukas Larson

