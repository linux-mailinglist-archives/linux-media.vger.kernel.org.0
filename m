Return-Path: <linux-media+bounces-44050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6DBC7989
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 08:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5323A4F4300
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 06:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9062D0602;
	Thu,  9 Oct 2025 06:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MYFsdviU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DC519047A
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759992958; cv=none; b=QT64u0DPfP1FAgvF1uYatfaGNM/3JON09BquwWaPBi9fa/JKznmLR3brjQYJrtT/sUUP21KdtmX+7DG1vYeIrMHbKqNOO/l7QBx8dD9WxV7brOaz7sPcl+RtNQb3Us1lGGKj7FcPEBbhh0JDhxrZIPwPRNnX/cEUtYPmljcrs5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759992958; c=relaxed/simple;
	bh=bL8yGAY+yC/fJM3mQOEJxhjHU9NM9bLCYt2JkSij1+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbKKsDXzE/WL7bTE2K24iGZvVwWMXqG+17Bn2FCxYXAnJmInlIc/opCVhtJr1k2yH64wmlP/C8vhp69ZA2s4RjN0VJOvcTZKLB3RmZikvnscODCfdm8JQRakk3xPUuVRAxf/aQBu77nzZXrcCoP2bfSx6q3ISqm3I8eFqS/1y4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MYFsdviU; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso698631e87.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 23:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759992954; x=1760597754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u4ni4TTOgAgYqtC2qaw+7bRQCgY9vHSh+QRiaiZcYqA=;
        b=MYFsdviUIcfBZrM2Xi5n2SOm3No+SV03Vys4mfJdMcx3SWd0M3GJTQLV1Tpgw0/DEB
         QiUzPHx2RSWTdiWjCbzLm/ITUecCcmh8DUjFvMRZq/z2P1JoFbWegrxCCsFi2OorJP4g
         5/P9mva5iAttaWDB5XlyjRuU7kLbKPUPWgMF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759992954; x=1760597754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4ni4TTOgAgYqtC2qaw+7bRQCgY9vHSh+QRiaiZcYqA=;
        b=AcudFuYoJrvnY+aWkgQa+o0kUgBV9c+BIAFoXUQl2fkc45J1mdEWglReSSA3kvhx+C
         e+HotsohSdBQaTpWkim/VLCOjkSff5tEForrKboaeCYoMAWxpwb89Yb3dYeJHCt6YBHk
         5L8nGbdHtnCHsx/kiE/c+UeNGn0X9ebY5Qxrm3UQG1s8S6fcQ7jAxo27GIdvEiAZ8OEZ
         k7KLSL3ZTSS1Du5LMou+lcf6x9EZchiQpyR9EE/8yCOMyAaxVHHyoJLhl0NUSPBbjmv9
         WfFxu9Ghz2Q29OYBqVQ8NI4YY8RflenG25Qc8GEfKduFMWWWqoWY8kwQAMOXFzicF89T
         WviQ==
X-Gm-Message-State: AOJu0YyXFzPfc7H0CIWmvs/2DaB7IeQ1+3HHo27u9mQmMD/T0R2/gt7W
	vPhhk3YH3PxcgiMRWM/fhl1Eei2i+rjtYCy29sOpeIG+Fa9N7JOSQLaBUHlGPl8Z28Xj0lebcxs
	Sbho=
X-Gm-Gg: ASbGnctq0FwHNdzRJJKfcHA5tLXW5YkN8if9OlnDxhcRfpy9b6awKDo9cKYq0gpLfac
	+gwB2NgXZXD/F3euWIMTXuP83++iX2ISy+GjmJVrlgdV65khrsUylWcHWwPs0tM6dyKGubGg4kg
	tP/qeEal3WNFNEBHSAI6NRWSDsncwphE8fhvfGkNMUiUxZztu2xAPyVhnExLFfOTOgYbVs5KZBu
	noQ9ypCnW/kKlbJeTHi6jFyp6VOc8mUEO9WawLdormvScP27rqnZ2fLhY6hu80rnLCb2ZVf8VXC
	he3uOl+lIIVvUs0jAvlLKkSomnX15hVLu4RvEG1Ch+0ywnHSME8Rw5PVrILthGcM2UPqa56R6oH
	dMdx9Se1/VLvEgDdTnnuxGbkIaKHzybAR1X7qI3XVmdeTNJw05567/zwN+iJ4PDGpjlpk8PBIRg
	gwAwLC4WdZk+BgPsR5Ekc=
X-Google-Smtp-Source: AGHT+IFpSXqij4QVVq9IZpE80TQZb++lQNHmuDtxx9jztg0nhZ12VeWUhD2wFCKcgZ76z2YDQnVCnw==
X-Received: by 2002:a05:6512:1325:b0:57e:f60:2330 with SMTP id 2adb3069b0e04-5906dc122b7mr1570249e87.21.1759992954058;
        Wed, 08 Oct 2025 23:55:54 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac00a21sm782467e87.4.2025.10.08.23.55.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 23:55:53 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57ea78e0618so769370e87.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 23:55:53 -0700 (PDT)
X-Received: by 2002:a05:6512:238c:b0:55f:4bf6:efeb with SMTP id
 2adb3069b0e04-5906dd73cb8mr2120109e87.43.1759992952571; Wed, 08 Oct 2025
 23:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>
In-Reply-To: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 9 Oct 2025 08:55:39 +0200
X-Gmail-Original-Message-ID: <CANiDSCst6-1g2vPSF4YnEbH6DFcz+WYEwGHc08kGyuH4OZ+adA@mail.gmail.com>
X-Gm-Features: AS18NWB4BYMzyzfeygc6_ZCriwtIJZfsDwmFGGZpOez4mXrLQj8Q-r5EoC6ZRag
Message-ID: <CANiDSCst6-1g2vPSF4YnEbH6DFcz+WYEwGHc08kGyuH4OZ+adA@mail.gmail.com>
Subject: Re: [REGRESSION] uvcvideo: Grandstream GUV3100 (2bab:0011) broken on
 recent kernels (including LTS)
To: Angel4005 <ooara1337@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-uvc-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"

Hi Angel

Thank you very much for the detailed report.

Your device has two entities with the same id:
VideoControl Interface Descriptor:
        bLength                31
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4


ideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0

And that confuses the code. We have recently introduced a change that
has probably triggered the regression
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/usb/uvc?id=0e2ee70291e64a30fe36960c85294726d34a103e

Do you know the commercial name of the device and if it is available to buy?

Could you try this patch and let me know if it fixes the issue?

diff --git a/drivers/media/usb/uvc/uvc_driver.c
b/drivers/media/usb/uvc/uvc_driver.c
index fa61f1d0ea2c..81937501fb0c 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -167,11 +167,23 @@ static struct uvc_entity
*uvc_entity_by_reference(struct uvc_device *dev,

 static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
 {
-       struct uvc_streaming *stream;
+       struct uvc_streaming *stream, *last_entry;
+       unsigned int count = 0;

        list_for_each_entry(stream, &dev->streams, list) {
                if (stream->header.bTerminalLink == id)
                        return stream;
+               count += 1;
+               last_entry = stream;
+       }
+
+       /*
+        * If the streaming entity has an invalid id, but it is the only
+        * one available, use it.
+        */
+       if (count == 1 && id == UVC_INVALID_ENTITY_ID) {
+               dev_err(&dev->intf->dev, "Heuristics triggered\n");
+               return last_entry;
        }

        return NULL;


Thanks

