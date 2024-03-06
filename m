Return-Path: <linux-media+bounces-6603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C4E8741BF
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 22:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9D04283FB0
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 21:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D201BF31;
	Wed,  6 Mar 2024 21:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="JqHpD0ar"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8E51B81E
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 21:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709759708; cv=none; b=LX2xzFGGfJSC2WgdaerSMlqQM0BrMQ6ys5FCZYXtqmAjjjrjYokiNPRm2eEhuYYuoTTQ5P2IBXjd1ML82soNsPYWz4cQc/2Xxt/el7FNeqgzS1depsD8XQdYQOGKRDeU2DWOY4n2aVgtrikUF4pj3io39X8t4PfQQ/1Ay3FT4bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709759708; c=relaxed/simple;
	bh=U4ojV2freBsIay7O1kFelpCQsTDSaSxNt3KMhpVVM/w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WMsdzsU2gbfcaoWr/1+is7NxJQQIN/yn9XXZiGNExxvWOIumYjkUiO7gejQaZSs7RWy9QhhsvL6pOAsJrVmwiO0SA19Eo46oat0DVadf11oLxEoLCdprgMLzsaSH4aOyEM+2udGyQZb2OWDQlHzmMlecHpCuyj4G39Hnk4JluI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=JqHpD0ar; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso138005276.2
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 13:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1709759700; x=1710364500; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8SWSZHihFYGOUDUtGv7Mlv9MGN/vHjGGWsX+7FLJm1E=;
        b=JqHpD0arTx7Skfpkn9jyfbOrkeKbNb+QSmnDYFJsy0GaWByqzt8QgYFHLAbvzgYSqn
         hNdFE4CABgKRnBWDbLp8/4HxQCVQ3I8nB2rPMHw06aVUyREdJ7a4rTnMPi89PiPJgCfM
         83IttZkbLCaEqexmNsbyLt/eFl9LJKjQJN5gBdQ79NnJoUQN9aV2df3jWcMxjeXgLSIw
         wMHUcC1hp3wTJef7pefJFI0SwVyUqg/cweg9AdfLbpcv9KVJ8zigAJbJ/NT6+8iu1ZFz
         3RHZGbooBctmeF9NN3BMfX6ThkRg5vxO6Lrqtor2q7fkzglFBqxxoj2wCjC8d9A015MU
         rArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709759700; x=1710364500;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SWSZHihFYGOUDUtGv7Mlv9MGN/vHjGGWsX+7FLJm1E=;
        b=PpTl6llxk0FybxZv+jLtNDNGoBYHe5TnYzS83uHo4EqPQxzA5QCjWfW0Z2Mkxn2tEF
         MEOXyem7/5PFiRXyBBlcHy5g10kF/TnfaZjZXYq7ScNaE1O8SCUeXbWRWPguquXg1J7Q
         MJi+JhH90zBOb3ZIbF327kxPYjXwmi2PWThmAwiorzpyi99U41Zm0lF3YjXPpzHvQPRb
         A2t7Iitd0GyIYR7gPGfUKFPZHvZRyTW9Z67IQ5HvoCf7Eq7eClCi1T5HGn39u9SUfErJ
         bWAjW49E0kAOuiCiLqMieUxp+l80NpWgMQHcz42GaBj78e+dXCG1uVgIpAzG2X5b6lSe
         cLWg==
X-Forwarded-Encrypted: i=1; AJvYcCUsPdpMXvgaDU9Lda118m5dVGeh/wV0V1yfTGiE2doEWIFTb7UIDIgN1Ct5US1XfOmyeeU60jpJZ9aYw/tqNEWIPfO6ll0zjY1XmOw=
X-Gm-Message-State: AOJu0YxdNkGp8WwZ2y2bEwpH87HtRA1bShVInWmIyQYMgKypx3wqbeoo
	6oMTwOyLgMCQaSqtl1QqXwYWwNTyD95zutjYXSzJXq+Bl95VR3acB4eR2pm+ouY=
X-Google-Smtp-Source: AGHT+IHeYwHovzjDsTvZJ/VndJD/GBo/Bl4qki+eCqii9nEmzeiZYGcSFwc2ajM8yzAWHcoswq5aTQ==
X-Received: by 2002:a5b:54b:0:b0:dcc:e187:6ceb with SMTP id r11-20020a5b054b000000b00dcce1876cebmr12856014ybp.17.1709759698398;
        Wed, 06 Mar 2024 13:14:58 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:eba4::7a9])
        by smtp.gmail.com with ESMTPSA id n15-20020a05622a040f00b0042debe709dasm6930722qtx.79.2024.03.06.13.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 13:14:57 -0800 (PST)
Message-ID: <5d3ba5f177bfbaaafe31f456e940a92fe94f62d2.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 13/13] staging: vc04_services: Add a V4L2 M2M codec
 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maarten <maarten@rmail.be>, Raspberry Pi Kernel Maintenance
	 <kernel-list@raspberrypi.com>, linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Umang Jain
 <umang.jain@ideasonboard.com>,  Dave Stevenson
 <dave.stevenson@raspberrypi.com>, John Cox <jc@kynesim.co.uk>, Dom Cobley
 <popcornmix@gmail.com>,  David Plowman <david.plowman@raspberrypi.com>,
 Maxim Devaev <mdevaev@gmail.com>
Date: Wed, 06 Mar 2024 16:14:56 -0500
In-Reply-To: <2123e328554f39764540aa429d2b86b8@rmail.be>
References: <20240303152635.2762696-1-maarten@rmail.be>
	 <20240303152635.2762696-14-maarten@rmail.be>
	 <5ddf8ee84e59595900cd27ca11bc7c762d327d39.camel@ndufresne.ca>
	 <2123e328554f39764540aa429d2b86b8@rmail.be>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvkoOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+gozpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhmtHYWTDxBOP5peztyc2PqeKsLsLWzAr7RDTmljb2xhcyBEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCgzYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udWs+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWA
 gMBAh4BAheAAAoJEHFTAi2sBqgcQX8An2By6LDEeMxi4B9hUbpvRnzaaeNqA J9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypwCfWKc9DorA9f5pyYlD5pQo6SgSoiC0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPohiBBMRAgAiBQJVwNwgAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHCZ4AJ0QwU6/G4c7h9CkMBT9ZxGLX4KSnQCgq0P7CX7hv/M7HeyfMFZe8t3vAEW0RE5pY29sYXMgRHVmcmVzbmUgKEIuIFNjLiBJbmZvcm1hdGlxdWUpIDxuaWNvbGFzZEBibHVlc3RyZWFrdGVjaC5jb20+iGAEExECACAFAkZjGzoCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHBl7AJ0d2lrzshMmJaik/EaDEakzEwqgxQCg0JVZMZm9gRfEou1FvinuZxwf/mu0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr+E7ItOqZEHAs+xabBgknYZIFPW5Ag0ERRA3UhAIAJ0rxl2HsVg/nSOAUt7U/T/W+RKzVAlD9orCB0pRVvyWNxSr8MHcH
 mWCxykLuB34ouM4GuDVRKfGnqLzJRBfjs7Ax9K2FI3Odund9xpviLCt1jFC0K XL04RebrFT7xjDfocDaSLFvgxMVs/Jr2/ckKPId1oKvgYgt/o+MzUabKyFB8wIvq4GMtj3LoBKLCie2nCaSt7uVUt6q2t5bNWrd3lO6/mWn7YMc5Hsn33H9pS0+9szw6m3dG08eMKNueDlt72QxiYl2rhjzkT4ltKEkFgYBdyrtIj1UO6eX+YXb4E1rCMJrdjBSgqDPK1sWHC7gliy+izr+XTHuFwlfy8gBpsAAwUIAJJNus64gri4HAL632eqVpza83EphX1IuHzLi1LlMnQ9Tm7XKag46NhmJbOByMG33LwBsBdLjjHQSVkYZFWUifq+NWSFC/kqlb72vW8rBAv64+i3QdfxK9FWbweiRsPpvuHjJQuecbPDJpubLaxKbu2aqLCN5LuHXvdQr6KiXwabT+OJ9AJAqHG7q4IEzg4RNUVn9AS6L8bxqMSocjqpWNBCY2efCVd/c6k4Acv6jXu+wDAZEbWXK+71uaUHExhigBYBpiHGrobe32YlTVE/XEIzKKywhm/Hkn5YKWzumLte6xiD9JhKabmD7uqIvLt2twUpz4BdPzj0dvGlSmvFcaaISQQYEQIACQUCRRA3UgIbDAAKCRBxUwItrAaoHJLyAKDeS3AFowM3f1Y3OFU6XRCTKK2ZhwCfT/7P9WDjkkmiq5AfeOiwVlpuHtM=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 05 mars 2024 =C3=A0 20:35 +0100, Maarten a =C3=A9crit=C2=A0:
> Nicolas Dufresne schreef op 2024-03-04 18:58:
> > Hi,
> >=20
> > Le dimanche 03 mars 2024 =C3=A0 16:10 +0100, Maarten Vanraes a =C3=A9cr=
it=C2=A0:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > This adds a V4L2 memory to memory device that wraps the MMAL
> > > video decode and video_encode components for H264 and MJPEG encode
> > > and decode, MPEG4, H263, and VP8 decode (and MPEG2 decode
> > > if the appropriate licence has been purchased).
> > >=20
> > > This patch squashes all the work done in developing the driver
> > > on the Raspberry Pi rpi-5.4.y kernel branch.
> > > Thanks to Kieran Bingham, Aman Gupta, Chen-Yu Tsai, and
> > > Marek Beh=C3=BAn for their contributions. Please refer to the
> > > rpi-5.4.y branch for the full history.
> >=20
> > It is really nice to see this RFC after all these years of downstream=
=20
> > work.
>=20
> Thanks, but my work pales in comparison to these original authors, I=20
> just needed my RPI4B to work as a mediabox with upstream kernel and=20
> playing media was not good without using the hw codec, so I worked on=20
> this and it works for me, (but I only tested encode and decode).
>=20
> > I believe it will be nicer to just refer to your downstream tree and=
=20
> > rewrite a
> > single commit message for the final submissions.
>=20
> I shouldn't keep all the squashed commit messages of all these patches?=
=20
> This first patch I cherry-picked (out of the rpi-6.7.y branch) was=20
> already a squashed patch from earlier work, and I squashed some more=20
> onto it.

No, you shouldn't, you should keep all the SOB, but write a new message.

>=20
> > As a companion information, we
> > ask all *new* drivers submitter to join a documented conformance tests=
=20
> > result
> > (when the codec have a conformance suite publicly available). This can=
=20
> > be placed
> > in the cover letter. We strongly suggest using Fluster from fluendo and
> > documenting the failires there. I believe it should not be a concern=
=20
> > for this
> > driver, as my own tests on RPi4 seems to show very decent results=20
> > downstream.
> > Reminder that the ISP based colorspace converison is faulty, and for=
=20
> > conformance
> > it should be disabled (which is fine, as long as you mention it, so=20
> > anyone else
> > can reproduce).
>=20
> Ok, got it, I'll try and get this Fluster thing.
>=20
> >=20
> > I'm not yet doing a full review, but you'll find some driver by general=
=20
> > comments
> > below.
>=20
> Thanks a lot for all the comments I got!
>=20
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Ensure OUTPUT timestamps are always forwarded
> > >=20
> > > The firmware by default tries to ensure that decoded frame
> > > timestamps always increment. This is counter to the V4L2 API
> > > which wants exactly the OUTPUT queue timestamps passed to the
> > > CAPTURE queue buffers.
> > >=20
> > > Disable the firmware option.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/vc04_services/codec: Add support for CID MPEG_HEADER_MODE
> > >=20
> > > Control V4L2_CID_MPEG_VIDEO_HEADER_MODE controls whether the encoder
> > > is meant to emit the header bytes as a separate packet or with the
> > > first encoded frame.
> > > Add support for it.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/vc04_services/codec: Clear last buf dequeued flag on START
> > >=20
> > > It appears that the V4L2 M2M framework requires the driver to manuall=
y
> > > call vb2_clear_last_buffer_dequeued on the CAPTURE queue during a
> > > V4L2_DEC_CMD_START.
> > > Add such a call.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/vc04-services/codec: Fix logical precedence issue
> > >=20
> > > Two issues identified with operator precedence in logical
> > > expressions. Fix them.
> > >=20
> > > https://github.com/raspberrypi/linux/issues/4040
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > vc04_services: bcm2835-codec: Switch to s32fract
> > >=20
> > > staging/bcm2835-codec: Add the unpacked (16bpp) raw formats
> > >=20
> > > Now that the firmware supports the unpacked (16bpp) variants
> > > of the MIPI raw formats, add the mappings.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Log the number of excess supported formats
> > >=20
> > > When logging that the firmware has provided more supported formats
> > > than we had allocated storage for, log the number allocated and
> > > returned.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Add support for pixel aspect ratio
> > >=20
> > > If the format is detected by the driver and a V4L2_EVENT_SOURCE_CHANG=
E
> > > event is generated, then pass on the pixel aspect ratio as well.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Implement additional g_selection calls for=20
> > > decode
> > >=20
> > > v4l_cropcap calls our vidioc_g_pixelaspect function to get the pixel
> > > aspect ratio, but also calls g_selection for V4L2_SEL_TGT_CROP_BOUNDS
> > > and V4L2_SEL_TGT_CROP_DEFAULT. Whilst it allows for=20
> > > vidioc_g_pixelaspect
> > > not to be implemented, it doesn't allow for either of the other two.
> > >=20
> > > Add in support for the additional selection targets.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Add VC-1 support.
> > >=20
> > > Providing the relevant licence has been purchased, then Pi0-3
> > > can decode VC-1.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Fix support for levels 4.1 and 4.2
> > >=20
> > > The driver said it supported H264 levels 4.1 and 4.2, but
> > > was missing the V4L2 to MMAL mappings.
> > >=20
> > > Add in those mappings.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Set the colourspace appropriately for RGB=20
> > > formats
> > >=20
> > > Video decode supports YUV and RGB formats. YUV needs to report=20
> > > SMPTE170M
> > > or REC709 appropriately, whilst RGB should report SRGB.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Pass corrupt frame flag.
> > >=20
> > > MMAL has the flag MMAL_BUFFER_HEADER_FLAG_CORRUPTED but that
> > > wasn't being passed through, so add it.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Do not update crop from S_FMT after res change
> > >=20
> > > During decode, setting the CAPTURE queue format was setting the crop
> > > rectangle to the requested height before aligning up the format to
> > > cater for simple clients that weren't expecting to deal with cropping
> > > and the SELECTION API.
> > > This caused problems on some resolution change events if the client
> > > didn't also then use the selection API.
> > >=20
> > > Disable the crop update after a resolution change.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > bcm2835: Allow compressed frames to set sizeimage (#4386)
> > >=20
> > > Allow the user to set sizeimage in TRY_FMT and S_FMT if the format
> > > flags have V4L2_FMT_FLAG_COMPRESSED set
> > >=20
> > > Signed-off-by: John Cox <jc@kynesim.co.uk>
> > >=20
> > > staging/bcm2835-codec: Change the default codec res to 32x32
> > >=20
> > > In order to effectively guarantee that a V4L2_EVENT_SOURCE_CHANGE
> > > event occurs, adopt a default resolution of 32x32 so that it
> > > is incredibly unlikely to be decoding a stream of that resolution
> > > and therefore failing to note a "change" requiring the event.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Add support for decoding interlaced streams
> > >=20
> > > The video decoder can support decoding interlaced streams, so add
> > > the required plumbing to signal this correctly.
> > >=20
> > > The encoder and ISP do NOT support interlaced data, so trying to
> > > configure an interlaced format on those nodes will be rejected.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Correct ENUM_FRAMESIZES stepsize to 2
> > >=20
> > > Being YUV420 formats, the step size is always 2 to avoid part
> > > chroma subsampling.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Return buffers to QUEUED not ERROR state
> > >=20
> > > Should start_streaming fail, or buffers be queued during
> > > stop_streaming, they should be returned to the core as QUEUED
> > > and not (as currently) as ERROR.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835_codec: Log MMAL flags in hex
> > >=20
> > > The flags is a bitmask, so it's far easier to interpret as hex
> > > data instead of decimal.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: bcm2835-codec: Allow custom specified strides/bytesperline.
> > >=20
> > > If the client provides a bytesperline value in try_fmt/s_fmt then
> > > validate it and correct if necessary.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835_codec: Add support for image_fx to deinterlace
> > >=20
> > > Adds another /dev/video node wrapping image_fx doing deinterlace.
> > >=20
> > > Co-developed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > >=20
> > > staging/bcm2835-v4l2_codec: Fix for encode selection API
> > >=20
> > > Matches correct behaviour from DECODE and DEINTERLACE
> > >=20
> > > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > >=20
> > > staging: bcm2835-codec: Allow decode res changed before=20
> > > STREAMON(CAPTURE)
> > >=20
> > > The V4L2 stateful video decoder API requires that you can STREAMON
> > > on only the OUTPUT queue, feed in buffers, and wait for the
> > > SOURCE_CHANGE event.
> > > This requires that we enable the MMAL output port at the same time
> > > as the input port, because the output port is the one that creates
> > > the SOURCE_CHANGED event.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Do not send buffers to the VPU unless streamin=
g
> > >=20
> > > With video decode we now enable both input and output ports on
> > > the component. This means that buffers will get passed to the VPU
> > > earlier than desired if they are queued befoer STREAMON.
> > >=20
> > > Check that the queue is streaming before sending buffers to the VPU.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: bcm2835-codec: Format changed should trigger drain
> > >=20
> > > When a format changed event occurs, the spec says that it
> > > triggers an implicit drain, and that needs to be signalled
> > > via -EPIPE.
> > >=20
> > > For BCM2835, the format changed event happens at the point
> > > the format change occurs, so no further buffers exist from
> > > before the resolution changed point. We therefore signal the
> > > last buffer immediately.
> > > We don't have a V4L2 available to us at this point, so set
> > > the videobuf2 queue last_buffer_dequeued flag directly.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: bcm2835-codec: Signal the firmware to stop on all changes
> > >=20
> > > The firmware defaults to not stopping video decode if only the
> > > pixel aspect ratio or colourspace change. V4L2 requires us
> > > to stop decoding on any change, therefore tell the firmware
> > > of the desire for this alternate behaviour.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: bcm2835-codec: Queue flushed buffers instead of completing
> > >=20
> > > When a buffer is returned on a port that is disabled, return it
> > > to the videobuf2 QUEUED state instead of DONE which returns it
> > > to the client.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: bcm2835_codec: Correct flushing code for refcounting
> > >=20
> > > Completions don't reference count, so setting the completion
> > > on the first buffer returned and then not reinitialising it
> > > means that the flush function doesn't behave as intended.
> > >=20
> > > Signal the completion when the last buffer is returned.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: bcm2835-codec: Ensure all ctrls are set on streamon
> > >=20
> > > Currently the code was only setting some controls from
> > > bcm2835_codec_set_ctrls, but it's simpler to use
> > > v4l2_ctrl_handler_setup to avoid forgetting to adding new
> > > controls to the list.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: bcm2835-codec: Add support for H&V Flips to ISP
> > >=20
> > > The ISP can do H & V flips whilst resizing or converting
> > > the image, so expose that via V4L2_CID_[H|V]FLIP.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > bcm2835-v4l2-codec: Remove advertised support of VP8
> > >=20
> > > The support for this format by firmware is very limited
> > > and won't be faster than the arm.
> > >=20
> > > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > >=20
> > > Pass V4L2_CID_MPEG_VIDEO_H264_MIN_QP/MAX_QP to bcm2835-v4l2-codec
> > >=20
> > > Following raspberrypi/linux#4704. This is necessary to set up
> > > quantization for variable bitrate to avoid video flickering.
> > >=20
> > > staging/bcm2835-codec: bytesperline for YUV420/YVU420 needs to be 64
> > >=20
> > > Matching https://github.com/raspberrypi/linux/pull/4419, the ISP
> > > block (which is also used on the input of the encoder, and output
> > > of the decoder) needs the base address of all planes to be aligned
> > > to multiples of 32. This includes the chroma planes of YUV420 and
> > > YVU420.
> > > If the height is only a multiple of 2 (not 4), then you get an odd
> > > number of lines in the second plane, which means the 3rd plane
> > > starts at a multiple of bytesperline/2.
> > >=20
> > > Set the minimum bytesperline alignment to 64 for those formats
> > > so that the plane alignment is always right.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging/bcm2835-codec: Allow a different stride alignment per role
> > >=20
> > > Deinterlace and decode aren't affected in the same way as encode
> > > and ISP by the alignment requirement on 3 plane YUV420.
> > > Decode would be affected, but it always aligns the height up to
> > > a macroblock, and uses the selection API to reflect that.
> > >=20
> > > Add in the facility to set the bytesperline alignment per role.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: vc04_services: codec: Add support for V4L2_PIX_FMT_RGBA32=
=20
> > > format
> > >=20
> > > We already support V4L2_PIX_FMT_BGR32 which is the same thing with re=
d
> > > and blue swapped, so it makes sense to include this variant as well.
> > >=20
> > > Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> > >=20
> > > bcm2835-codec: Return empty buffers to the VPU instead of queueing to=
=20
> > > vbuf2
> > >=20
> > > The encoder can skip frames totally should rate control overshoot
> > > the target bitrate too far. In this situation it generates an
> > > output buffer of length 0.
> > > V4L2 treats a buffer of length 0 as an end of stream flag, which is
> > > not appropriate in this case, therefore we can not return that buffer
> > > to the client.
> > >=20
> > > The driver was returning the buffer to videobuf2 in the QUEUED state,
> > > however that buffer was then not dequeued again, so the number of
> > > buffers was reduced each time this happened. In the pathological
> > > case of using GStreamer's videotestsrc in mode 1 for noise, this=20
> > > happens
> > > sufficiently frequently to totally stall the pipeline.
> > >=20
> > > If the port is still enabled then return the buffer straight back to
> > > the VPU rather than to videobuf2.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > vc04_services: bcm2835-codec: Add support for V4L2_PIX_FMT_NV12_COL12=
8
> > >=20
> > > V4L2_PIX_FMT_NV12_COL128 is supported by the ISP and the input of
> > > video_encode, output of video_decode, and both input and output
> > > of the ISP.
> > >=20
> > > Add in the plumbing to support the format on those ports.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > vc04_services: bcm2835-codec: Set crop_height for compressed formats
> > >=20
> > > In particular for the encoder where the CAPTURE format dictates
> > > the parameters given to the codec we need to be able to set the
> > > value passed as the crop_height for the compressed format.
> > > There's no crop available for cropped modes, so always set
> > > crop_height to the requested height.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > vc04_services: bcm2835-codec: Set port format from s_selection
> > >=20
> > > s_selection allows the crop region of an uncompressed pixel
> > > format to be specified, but it wasn't passing the setting on to
> > > the firmware. Depending on call order this would potentially
> > > mean that the crop wasn't actioned.
> > >=20
> > > Set the port format on s_selection if we have a component created.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > bcm2835-codec: /dev/video31 as interface to image_encode JPEG encoder
> > >=20
> > > Signed-off-by: Maxim Devaev <mdevaev@gmail.com>
> > >=20
> > > bcm2835-v4l2-codec: support H.264 5.0 and 5.1 levels
> > >=20
> > > vc04_services: bcm2835-codec:  Remove redundant role check
> > >=20
> > > vidioc_try_encoder_cmd checks the role, but the ioctl is disabled
> > > for any roles in which it is invalid.
> > >=20
> > > Remove the redundant check.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > vc04_services: bcm2835-codec: Allow encoder_cmd on ISP and deinterlac=
e
> > >=20
> > > ISP and deinterlace also need a mechanism for passing effectively
> > > an EOS through the pipeline to signal when all buffers have been
> > > processed.
> > >=20
> > > VIDIOC_ENCODER_CMD does exactly this for encoders, so reuse the same
> > > function for ISP and deinterlace.
> > > (VIDIOC_DECODER_CMD is slightly different in that it also passes
> > > details of when and how to stop, so is not as relevant).
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > vc04_services: bcm2835_codec: Allow larger images through the ISP
> > >=20
> > > Whilst the codecs are restricted to 1920x1080 / 1080x1920, the ISP
> > > isn't, but the limits advertised via V4L2 was 1920x1920 for all
> > > roles.
> > >=20
> > > Increase the limit to 16k x 16k for the ISP.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > media: bcm2835-v4l2-codec: Enable selection ioctl for ISP
> > >=20
> > > The ISP cases do nothing. Remove the break that separates them from=
=20
> > > the
> > > deinterlace case so they now do the same as deinterlace. This enables
> > > simple width & height setting, but does not enable setting left and
> > > top coordinates.
> > >=20
> > > Signed-off-by: John Cox <jc@kynesim.co.uk>
> > >=20
> > > media: bcm2835-v4l2-codec: Add profile & level ctrls to decode
> > >=20
> > > In order to support discovery of what profile & levels are supported=
=20
> > > by
> > > stateful decoders implement the profile and level controls where they
> > > are defined by V4L2.
> > >=20
> > > Signed-off-by: John Cox <jc@kynesim.co.uk>
> > >=20
> > > vc04_services: bcm2835_codec: Ignore READ_ONLY ctrls in s_ctrl
> > >=20
> > > In adding the MPEG2/MPEG4/H264 level and profile controls to
> > > the decoder, they weren't declared as read-only, nor handlers
> > > added to bcm2835_codec_s_ctrl. That resulted in an error message
> > > "Invalid control" being logged every time v4l2_ctrl_handler_setup
> > > was called from bcm2835_codec_create_component.
> > >=20
> > > Define those controls as read only, and exit early from s_ctrl
> > > on read only controls.
> > >=20
> > > Fixes: "media: bcm2835-v4l2-codec: Add profile & level ctrls to=20
> > > decode"
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > vc04_services: bcm2835_codec: Set MPEG2_LEVEL control to READ_ONLY
> > >=20
> > > V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL  was missed from
> > > "vc04_services: bcm2835_codec: Ignore READ_ONLY ctrls in s_ctrl"
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: bcm2835-codec: Add V4L2_CID_MPEG_VIDEO_B_FRAMES control
> > >=20
> > > FFmpeg insists on trying to set V4L2_CID_MPEG_VIDEO_B_FRAMES to
> > > 0, and generates an error should it fail.
> > > As our encoder doesn't support B frames, add a stub handler for
> > > it to silence FFmpeg.
>=20
> See near the middle for your comment on B frames.
>=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: bcm2835-codec: Add support for V4L2_CID_MPEG_VIDEO_GOP_SIZE
> > >=20
> > > For H264, V4L2_CID_MPEG_VIDEO_H264_I_PERIOD is meant to be the intra
> > > I-frame period, whilst V4L2_CID_MPEG_VIDEO_GOP_SIZE is the intra IDR
> > > frame period.
> > > The firmware encoder doesn't produce I-frames that aren't IDR as well=
,
> > > therefore V4L2_CID_MPEG_VIDEO_GOP_SIZE is technically the correct
> > > control, however users may have adopted=20
> > > V4L2_CID_MPEG_VIDEO_H264_I_PERIOD.
> > >=20
> > > Add support for V4L2_CID_MPEG_VIDEO_GOP_SIZE controlling the encoder,
> > > and have VIDIOC_S_CTRL for V4L2_CID_MPEG_VIDEO_H264_I_PERIOD update
> > > the value for V4L2_CID_MPEG_VIDEO_GOP_SIZE (the reverse is not
> > > implemented).
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: bcm2835-codec: Add missing alignment for V4L2_PIX_FMT_RGBA32
> > >=20
> > > The patch adding image encode (JPEG) to the driver missed adding
> > > the alignment constraint for V4L2_PIX_FMT_RGBA32, which meant
> > > it ended up giving a stride and size of 0.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > vc04_services: bcm2835-codec: Correct alignment requirements for YUYV
> > >=20
> > > The firmware wants the YUYV format stride alignment to be to a=20
> > > multiple
> > > of 32pixels / 64 bytes. The kernel driver was configuring it to a=20
> > > multiple
> > > of 16 pixels / 32 bytes, which then failed when it tried starting to
> > > stream.
> > >=20
> > > Correct the alignment requirements.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > staging: vchiq_arm: Register bcm2835-codec as a platform driver
> > >=20
> > > Following the same pattern as bcm2835-camera and bcm2835-audio,
> > > register the V4L2 codec driver as a platform driver
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Maarten Vanraes <maarten@rmail.be>
> > > ---
> > >  drivers/staging/vc04_services/Kconfig         |    2 +
> > >  drivers/staging/vc04_services/Makefile        |    2 +
> > >  .../vc04_services/bcm2835-codec/Kconfig       |   11 +
> > >  .../vc04_services/bcm2835-codec/Makefile      |    5 +
> > >  .../bcm2835-codec/bcm2835-v4l2-codec.c        | 3973=20
> > > +++++++++++++++++
> > >  .../interface/vchiq_arm/vchiq_arm.c           |    3 +
> > >  .../vchiq-mmal/mmal-parameters.h              |    8 +
> > >  7 files changed, 4004 insertions(+)
> > >  create mode 100644=20
> > > drivers/staging/vc04_services/bcm2835-codec/Kconfig
> > >  create mode 100644=20
> > > drivers/staging/vc04_services/bcm2835-codec/Makefile
> > >  create mode 100644=20
> > > drivers/staging/vc04_services/bcm2835-codec/bcm2835-v4l2-codec.c
> > >=20
> > > diff --git a/drivers/staging/vc04_services/Kconfig=20
> > > b/drivers/staging/vc04_services/Kconfig
> > > index e71e5a8b820a..568880ca9760 100644
> > > --- a/drivers/staging/vc04_services/Kconfig
> > > +++ b/drivers/staging/vc04_services/Kconfig
> > > @@ -44,6 +44,8 @@ source=20
> > > "drivers/staging/vc04_services/bcm2835-audio/Kconfig"
> > >=20
> > >  source "drivers/staging/vc04_services/bcm2835-camera/Kconfig"
> > >=20
> > > +source "drivers/staging/vc04_services/bcm2835-codec/Kconfig"
> > > +
> > >  source "drivers/staging/vc04_services/bcm2835-isp/Kconfig"
> > >=20
> > >  source "drivers/staging/vc04_services/vchiq-mmal/Kconfig"
> > > diff --git a/drivers/staging/vc04_services/Makefile=20
> > > b/drivers/staging/vc04_services/Makefile
> > > index 2cebf92525a0..903c949a1ee5 100644
> > > --- a/drivers/staging/vc04_services/Makefile
> > > +++ b/drivers/staging/vc04_services/Makefile
> > > @@ -14,6 +14,8 @@ endif
> > >=20
> > >  obj-$(CONFIG_SND_BCM2835)		+=3D bcm2835-audio/
> > >  obj-$(CONFIG_VIDEO_BCM2835)		+=3D bcm2835-camera/
> > > +obj-$(CONFIG_VIDEO_CODEC_BCM2835)	+=3D bcm2835-codec/
> > >  obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+=3D vchiq-mmal/
> > >  obj-$(CONFIG_BCM_VC_SM_CMA)		+=3D vc-sm-cma/
> > >  obj-$(CONFIG_VIDEO_ISP_BCM2835) 	+=3D bcm2835-isp/
> > > +
> > > diff --git a/drivers/staging/vc04_services/bcm2835-codec/Kconfig=20
> > > b/drivers/staging/vc04_services/bcm2835-codec/Kconfig
> > > new file mode 100644
> > > index 000000000000..761c8ba4b40f
> > > --- /dev/null
> > > +++ b/drivers/staging/vc04_services/bcm2835-codec/Kconfig
> > > @@ -0,0 +1,11 @@
> > > +config VIDEO_CODEC_BCM2835
> > > +	tristate "BCM2835 Video codec support"
> > > +	depends on MEDIA_SUPPORT && MEDIA_CONTROLLER
> > > +	depends on VIDEO_DEV && (ARCH_BCM2835 || COMPILE_TEST)
> > > +	select BCM2835_VCHIQ_MMAL
> > > +	select VIDEOBUF2_DMA_CONTIG
> > > +	select V4L2_MEM2MEM_DEV
> > > +	help
> > > +	  Say Y here to enable the V4L2 video codecs for
> > > +	  Broadcom BCM2835 SoC. This operates over the VCHIQ interface
> > > +	  to a service running on VideoCore.
> > > diff --git a/drivers/staging/vc04_services/bcm2835-codec/Makefile=20
> > > b/drivers/staging/vc04_services/bcm2835-codec/Makefile
> > > new file mode 100644
> > > index 000000000000..0efc20181aaf
> > > --- /dev/null
> > > +++ b/drivers/staging/vc04_services/bcm2835-codec/Makefile
> > > @@ -0,0 +1,5 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +bcm2835-codec-objs :=3D bcm2835-v4l2-codec.o
> > > +
> > > +obj-$(CONFIG_VIDEO_CODEC_BCM2835) +=3D bcm2835-codec.o
> > > +
> > > diff --git=20
> > > a/drivers/staging/vc04_services/bcm2835-codec/bcm2835-v4l2-codec.c=
=20
> > > b/drivers/staging/vc04_services/bcm2835-codec/bcm2835-v4l2-codec.c
> > > new file mode 100644
> > > index 000000000000..a76e198102fa
> > > --- /dev/null
> > > +++ b/drivers/staging/vc04_services/bcm2835-codec/bcm2835-v4l2-codec.=
c
> > > @@ -0,0 +1,3973 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +/*
> > > + * A v4l2-mem2mem device that wraps the video codec MMAL component.
> > > + *
> > > + * Copyright 2018 Raspberry Pi (Trading) Ltd.
> > > + * Author: Dave Stevenson (dave.stevenson@raspberrypi.com)
> > > + *
> > > + * Loosely based on the vim2m virtual driver by Pawel Osciak
> > > + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> > > + * Pawel Osciak, <pawel@osciak.com>
> > > + * Marek Szyprowski, <m.szyprowski@samsung.com>
> > > + *
> > > + * Whilst this driver uses the v4l2_mem2mem framework, it does not=
=20
> > > need the
> > > + * scheduling aspects, so will always take the buffers, pass them to=
=20
> > > the VPU,
> > > + * and then signal the job as complete.
> > > + *
> > > + * This program is free software; you can redistribute it and/or=20
> > > modify
> > > + * it under the terms of the GNU General Public License as published=
=20
> > > by the
> > > + * Free Software Foundation; either version 2 of the
> > > + * License, or (at your option) any later version
> > > + */
> > > +#include <linux/module.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/fs.h>
> > > +#include <linux/timer.h>
> > > +#include <linux/sched.h>
> > > +#include <linux/syscalls.h>
> > > +
> > > +#include <media/v4l2-mem2mem.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-ioctl.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-event.h>
> > > +#include <media/videobuf2-dma-contig.h>
> > > +
> > > +#include "../vchiq-mmal/mmal-encodings.h"
> > > +#include "../vchiq-mmal/mmal-msg.h"
> > > +#include "../vchiq-mmal/mmal-parameters.h"
> > > +#include "../vchiq-mmal/mmal-vchiq.h"
> > > +
> > > +#include "../vc-sm-cma/vc_sm_knl.h"
> > > +
> > > +#include "../interface/vchiq_arm/vchiq_bus.h"
> > > +
> > > +MODULE_IMPORT_NS(DMA_BUF);
> > > +
> > > +/*
> > > + * Default /dev/videoN node numbers for decode and encode.
> > > + * Deliberately avoid the very low numbers as these are often taken=
=20
> > > by webcams
> > > + * etc, and simple apps tend to only go for /dev/video0.
> > > + */
> > > +static int decode_video_nr =3D 10;
> > > +module_param(decode_video_nr, int, 0644);
> > > +MODULE_PARM_DESC(decode_video_nr, "decoder video device number");
> > > +
> > > +static int encode_video_nr =3D 11;
> > > +module_param(encode_video_nr, int, 0644);
> > > +MODULE_PARM_DESC(encode_video_nr, "encoder video device number");
> > > +
> > > +static int isp_video_nr =3D 12;
> > > +module_param(isp_video_nr, int, 0644);
> > > +MODULE_PARM_DESC(isp_video_nr, "isp video device number");
> > > +
> > > +static int deinterlace_video_nr =3D 18;
> > > +module_param(deinterlace_video_nr, int, 0644);
> > > +MODULE_PARM_DESC(deinterlace_video_nr, "deinterlace video device=20
> > > number");
> > > +
> > > +static int encode_image_nr =3D 31;
> > > +module_param(encode_image_nr, int, 0644);
> > > +MODULE_PARM_DESC(encode_image_nr, "encoder image device number");
> >=20
> > I'd drop this from upstream submission.
>=20
> I assume you mean dropping the choice for specifc video device numbers?=
=20
> (not dropping only the image_nr or dropping the encode_image role?)

Correct, dropping the module param to chose a device number.

>=20
> > > +
> > > +/*
> > > + * Workaround for GStreamer v4l2convert component not considering=
=20
> > > Bayer formats
> > > + * as raw, and therefore not considering a V4L2 device that supports=
=20
> > > them as
> > > + * a suitable candidate.
> > > + */
> > > +static bool disable_bayer;
> > > +module_param(disable_bayer, bool, 0644);
> > > +MODULE_PARM_DESC(disable_bayer, "Disable support for Bayer formats")=
;
> > >=20
> >=20
> > I'd drop this too, you can work with upstream GStreamer maintainers to=
=20
> > fix this
> > issue instead (someone like me ?). I believe there is a pending (and=
=20
> > aging) MR
> > from Mauro actually to address this, and some smaller parts have been=
=20
> > rewritten
> > and merged meanwhile, so this issue might not even exist anymore.
>=20
> I guess it's time to test this out.
>=20
> > > +
> > > +static unsigned int debug;
> > > +module_param(debug, uint, 0644);
> > > +MODULE_PARM_DESC(debug, "activates debug info (0-3)");
> > >=20
> >=20
> > Other V4L2 drivers uses a sysfs dev_debug file to turn on/off logging.=
=20
> > The
> > logging can also be fine tuned with dynamic debug.
>=20
> Ok, I'll peek into these other drivers and do something similar.

Actually, I'm wrong, a lot of drivers do the same with custom log levels. N=
ot
sure I'm fan of it though ;-P

>=20
> > > +
> > > +static bool advanced_deinterlace =3D true;
> > > +module_param(advanced_deinterlace, bool, 0644);
> > > +MODULE_PARM_DESC(advanced_deinterlace, "Use advanced deinterlace");
> > > +
> > > +static int field_override;
> > > +module_param(field_override, int, 0644);
> > > +MODULE_PARM_DESC(field_override, "force TB(8)/BT(9) field");
> >=20
> > I'd drop this one too. If the driver can force a specific field order=
=20
> > regardless
> > the input data, I'd suggest working on a control instead.
>=20
> Not sure if this is a specific need for downstream users, but I guess if=
=20
> it's input related, it would make more sense to have a control? I wonder=
=20
> if anyone really needs this? what the specific reasons are?
>=20
> > > +
> > > +enum bcm2835_codec_role {
> > > +	DECODE,
> > > +	ENCODE,
> > > +	ISP,
> > > +	DEINTERLACE,
> > > +	ENCODE_IMAGE,
> > > +	NUM_ROLES
> > > +};
> >=20
> > I believe the organization or naming of the drive can be improved. Only=
=20
> > 2/5
> > roles falls into the "CODEC" category. If you are making 5 drivers with=
=20
> > shared
> > code, I'd split shared code properly, and submit these in their own=20
> > commits.
>=20
> tbh, I started this with the personal need for DEC only and only tested=
=20
> decode and encode, and I figured to keep this as someone might have use=
=20
> for this. Splitting this up in 5 different drivers might be overkill?=20
> Don't most -codec drivers have encode and decode together?

Most hardware have seperate and independant cores for all these. And its mo=
st
likely the case for the Pi too, its just happen that they share the same mm=
al
protocol, as we don't speak to the hardware but to a firmware (another OS i=
n
fact).

>=20
> I'm a noob here, but don't these other roles use some form of encoder=20
> too?

In practice, there is a different video device for each of these already. M=
y
comment was mostly that generally it is preferred to avoid doing switch and=
 if
on roles all over the place, and use ops function in the common code.

>=20
> > > +
> > > +static const char * const roles[] =3D {
> > > +	"decode",
> > > +	"encode",
> > > +	"isp",
> > > +	"image_fx",
> > > +	"encode_image",
> > > +};
> > > +
> > > +static const char * const components[] =3D {
> > > +	"ril.video_decode",
> > > +	"ril.video_encode",
> > > +	"ril.isp",
> > > +	"ril.image_fx",
> > > +	"ril.image_encode",
> > > +};
> > > +
> > > +/* Timeout for stop_streaming to allow all buffers to return */
> > > +#define COMPLETE_TIMEOUT (2 * HZ)
> > > +
> > > +#define MIN_W		32
> > > +#define MIN_H		32
> > > +#define MAX_W_CODEC	1920
> > > +#define MAX_H_CODEC	1920
> > > +#define MAX_W_ISP	16384
> > > +#define MAX_H_ISP	16384
> > > +#define BPL_ALIGN	32
> > > +/*
> > > + * The decoder spec supports the V4L2_EVENT_SOURCE_CHANGE event, but=
=20
> > > the docs
> > > + * seem to want it to always be generated on startup, which prevents=
=20
> > > the client
> > > + * from configuring the CAPTURE queue based on any parsing it has=
=20
> > > already done
> > > + * which may save time and allow allocation of CAPTURE buffers early=
.=20
> > > Surely
> > > + * SOURCE_CHANGE means something has changed, not just "always=20
> > > notify".
> >=20
> > Please don't try and bug report the spec in your code. In fact, this
> > interpretation of the spec is incorrect. If userspace have allocated=
=20
> > and called
> > STREAMON on the capture queue, the source change event can safely be=
=20
> > skipped.
> > The issue you had downstream was that the decision was only made based=
=20
> > on the
> > format initialized from the OUTPUT queue format (indirect format=20
> > setting). As a
> > side effect, userspace that did not want to risk having to allocate=20
> > twice the
> > buffers, but did hint the width/height in the OUTPUT queue format could=
=20
> > not
> > work.
>=20
> IC
>=20
> > > + *
> > > + * For those clients that don't set the CAPTURE resolution, adopt a=
=20
> > > default
> > > + * resolution that is seriously unlikely to be correct, therefore=
=20
> > > almost
> > > + * guaranteed to get the SOURCE_CHANGE event.
> > > + */
> > > +#define DEFAULT_WIDTH	32
> > > +#define DEFAULT_HEIGHT	32
> >=20
> > You have to set a default format, this is mandated by the spec. Now,=
=20
> > that format
> > should be updated if the client hint the display resolution (or even=
=20
> > coded
> > resolution) in S_FMT(OUTPUT). In any case, it should not interfere with=
=20
> > the
> > decision to sent SOURCE_CHANGE. If the CAPTURE queue is not configure,=
=20
> > you send
> > SOURCE_CHANGE always (basically asking userspace to configure the=20
> > queue),
> > otherwise you can send only if needed.
>=20
> Ok, I can see that this will end up to be quite different from the=20
> original downstream driver. I'll try and make changes.
>=20
> > > +/*
> > > + * The unanswered question - what is the maximum size of a compresse=
d=20
> > > frame?
> > > + * V4L2 mandates that the encoded frame must fit in a single buffer.=
=20
> > > Sizing
> > > + * that buffer is a compromise between wasting memory and risking no=
t=20
> > > fitting.
> > > + * The 1080P version of Big Buck Bunny has some frames that exceed=
=20
> > > 512kB.
> > > + * Adopt a moderately arbitrary split at 720P for switching between=
=20
> > > 512 and
> > > + * 768kB buffers.
> > > + */
> > > +#define DEF_COMP_BUF_SIZE_GREATER_720P	(768 << 10)
> > > +#define DEF_COMP_BUF_SIZE_720P_OR_LESS	(512 << 10)
> >=20
> > Your buffer size seems rather small by default (note that you should=
=20
> > also accept
> > bigger size if userspace asked for it). In general though, this issue=
=20
> > is true
> > for all drivers, we should certainly generalized this into v4l2-common=
=20
> > at some
> > point, but its not your fault if it wasn't done yet, so not really=20
> > needed.
>=20
> At some point, we'll have to change this code then, when that happens.
>=20
> > > +/* JPEG image can be very large. For paranoid reasons 4MB is used */
> > > +#define DEF_COMP_BUF_SIZE_JPEG (4096 << 10)
> > > +
> > > +/* Flags that indicate a format can be used for capture/output */
> > > +#define MEM2MEM_CAPTURE		BIT(0)
> > > +#define MEM2MEM_OUTPUT		BIT(1)
> > > +
> > > +#define BCM2835_V4L_CODEC_NAME	"bcm2835-codec"
> > > +#define MEM2MEM_NAME		"bcm2835-codec"
> > > +
> > > +struct bcm2835_codec_fmt {
> > > +	u32	fourcc;
> > > +	int	depth;
> > > +	u8	bytesperline_align[NUM_ROLES];
> > > +	u32	flags;
> > > +	u32	mmal_fmt;
> > > +	int	size_multiplier_x2;
> > > +	bool	is_bayer;
> > > +};
> >=20
> > For this and your following configuration structure, it would be nice=
=20
> > to see if
> > you could make use of the v4l2-common. If the firmware is calculating=
=20
> > the buffer
> > size, I'd say this is not important, but if the kernel driver is=20
> > calculating it,
> > it would be much safer to keep this in one place. Broken stride and=20
> > buffer size
> > calculation are unfortunately too common, and unavoidably cause=20
> > security
> > concerns.
>=20
> I am a fan of not having multiple identical definitions. I'll see if I=
=20
> can use v4l-common for these things.
>=20
> > > +
> > > +static const struct bcm2835_codec_fmt supported_formats[] =3D {
> > > +	{
> > > +		/* YUV formats */
> > > +		.fourcc			=3D V4L2_PIX_FMT_YUV420,
> > > +		.depth			=3D 8,
> > > +		.bytesperline_align	=3D { 32, 64, 64, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_I420,
> > > +		.size_multiplier_x2	=3D 3,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_YVU420,
> > > +		.depth			=3D 8,
> > > +		.bytesperline_align	=3D { 32, 64, 64, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_YV12,
> > > +		.size_multiplier_x2	=3D 3,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_NV12,
> > > +		.depth			=3D 8,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_NV12,
> > > +		.size_multiplier_x2	=3D 3,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_NV21,
> > > +		.depth			=3D 8,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_NV21,
> > > +		.size_multiplier_x2	=3D 3,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_RGB565,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_RGB16,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_YUYV,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 64, 64, 64, 64, 64 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_YUYV,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_UYVY,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 64, 64, 64, 64, 64 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_UYVY,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_YVYU,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 64, 64, 64, 64, 64 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_YVYU,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_VYUY,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 64, 64, 64, 64, 64 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_VYUY,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_NV12_COL128,
> > > +		.depth			=3D 8,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_YUVUV128,
> > > +		.size_multiplier_x2	=3D 3,
> > > +	}, {
> > > +		/* RGB formats */
> > > +		.fourcc			=3D V4L2_PIX_FMT_RGB24,
> > > +		.depth			=3D 24,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_RGB24,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_BGR24,
> > > +		.depth			=3D 24,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BGR24,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_BGR32,
> > > +		.depth			=3D 32,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BGRA,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_RGBA32,
> > > +		.depth			=3D 32,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_RGBA,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		/* Bayer formats */
> > > +		/* 8 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_SRGGB8,
> > > +		.depth			=3D 8,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SRGGB8,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SBGGR8,
> > > +		.depth			=3D 8,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SBGGR8,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGRBG8,
> > > +		.depth			=3D 8,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGRBG8,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGBRG8,
> > > +		.depth			=3D 8,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGBRG8,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		/* 10 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_SRGGB10P,
> > > +		.depth			=3D 10,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SRGGB10P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SBGGR10P,
> > > +		.depth			=3D 10,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SBGGR10P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGRBG10P,
> > > +		.depth			=3D 10,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGRBG10P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGBRG10P,
> > > +		.depth			=3D 10,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGBRG10P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		/* 12 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_SRGGB12P,
> > > +		.depth			=3D 12,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SRGGB12P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SBGGR12P,
> > > +		.depth			=3D 12,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SBGGR12P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGRBG12P,
> > > +		.depth			=3D 12,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGRBG12P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGBRG12P,
> > > +		.depth			=3D 12,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGBRG12P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		/* 14 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_SRGGB14P,
> > > +		.depth			=3D 14,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SRGGB14P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SBGGR14P,
> > > +		.depth			=3D 14,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SBGGR14P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGRBG14P,
> > > +		.depth			=3D 14,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGRBG14P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGBRG14P,
> > > +		.depth			=3D 14,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGBRG14P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		/* 16 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_SRGGB16,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SRGGB16,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SBGGR16,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SBGGR16,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGRBG16,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGRBG16,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGBRG16,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGBRG16,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		/* Bayer formats unpacked to 16bpp */
> > > +		/* 10 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_SRGGB10,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SRGGB10,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SBGGR10,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SBGGR10,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGRBG10,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGRBG10,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGBRG10,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGBRG10,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		/* 12 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_SRGGB12,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SRGGB12,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SBGGR12,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SBGGR12,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGRBG12,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGRBG12,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGBRG12,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGBRG12,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		/* 14 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_SRGGB14,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SRGGB14,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SBGGR14,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SBGGR14,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGRBG14,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGRBG14,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_SGBRG14,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_BAYER_SGBRG14,
> > > +		.size_multiplier_x2	=3D 2,
> > > +		.is_bayer		=3D true,
> > > +	}, {
> > > +		/* Monochrome MIPI formats */
> > > +		/* 8 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_GREY,
> > > +		.depth			=3D 8,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_GREY,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		/* 10 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_Y10P,
> > > +		.depth			=3D 10,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_Y10P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		/* 12 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_Y12P,
> > > +		.depth			=3D 12,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_Y12P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		/* 14 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_Y14P,
> > > +		.depth			=3D 14,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_Y14P,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		/* 16 bit */
> > > +		.fourcc			=3D V4L2_PIX_FMT_Y16,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_Y16,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		/* 10 bit as 16bpp */
> > > +		.fourcc			=3D V4L2_PIX_FMT_Y10,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_Y10,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		/* 12 bit as 16bpp */
> > > +		.fourcc			=3D V4L2_PIX_FMT_Y12,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_Y12,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		/* 14 bit as 16bpp */
> > > +		.fourcc			=3D V4L2_PIX_FMT_Y14,
> > > +		.depth			=3D 16,
> > > +		.bytesperline_align	=3D { 32, 32, 32, 32, 32 },
> > > +		.flags			=3D 0,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_Y14,
> > > +		.size_multiplier_x2	=3D 2,
> > > +	}, {
> > > +		/* Compressed formats */
> > > +		.fourcc			=3D V4L2_PIX_FMT_H264,
> > > +		.depth			=3D 0,
> > > +		.flags			=3D V4L2_FMT_FLAG_COMPRESSED,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_H264,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_JPEG,
> > > +		.depth			=3D 0,
> > > +		.flags			=3D V4L2_FMT_FLAG_COMPRESSED,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_JPEG,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_MJPEG,
> > > +		.depth			=3D 0,
> > > +		.flags			=3D V4L2_FMT_FLAG_COMPRESSED,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_MJPEG,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_MPEG4,
> > > +		.depth			=3D 0,
> > > +		.flags			=3D V4L2_FMT_FLAG_COMPRESSED,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_MP4V,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_H263,
> > > +		.depth			=3D 0,
> > > +		.flags			=3D V4L2_FMT_FLAG_COMPRESSED,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_H263,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_MPEG2,
> > > +		.depth			=3D 0,
> > > +		.flags			=3D V4L2_FMT_FLAG_COMPRESSED,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_MP2V,
> > > +	}, {
> > > +		.fourcc			=3D V4L2_PIX_FMT_VC1_ANNEX_G,
> > > +		.depth			=3D 0,
> > > +		.flags			=3D V4L2_FMT_FLAG_COMPRESSED,
> > > +		.mmal_fmt		=3D MMAL_ENCODING_WVC1,
> > > +	}
> > > +};
> > > +
> > > +struct bcm2835_codec_fmt_list {
> > > +	struct bcm2835_codec_fmt *list;
> > > +	unsigned int num_entries;
> > > +};
> > > +
> > > +struct m2m_mmal_buffer {
> > > +	struct v4l2_m2m_buffer	m2m;
> > > +	struct mmal_buffer	mmal;
> > > +};
> > > +
> > > +/* Per-queue, driver-specific private data */
> > > +struct bcm2835_codec_q_data {
> > > +	/*
> > > +	 * These parameters should be treated as gospel, with everything=
=20
> > > else
> > > +	 * being determined from them.
> > > +	 */
> > > +	/* Buffer width/height */
> > > +	unsigned int		bytesperline;
> > > +	unsigned int		height;
> > > +	/* Crop size used for selection handling */
> > > +	unsigned int		crop_width;
> > > +	unsigned int		crop_height;
> > > +	bool			selection_set;
> > > +	struct v4l2_fract	aspect_ratio;
> > > +	enum v4l2_field		field;
> > > +
> > > +	unsigned int		sizeimage;
> > > +	unsigned int		sequence;
> > > +	struct bcm2835_codec_fmt	*fmt;
> > > +
> > > +	/* One extra buffer header so we can send an EOS. */
> > > +	struct m2m_mmal_buffer	eos_buffer;
> > > +	bool			eos_buffer_in_use;	/* debug only */
> > > +};
> > > +
> > > +struct bcm2835_codec_dev {
> > > +	struct vchiq_device *device;
> > > +
> > > +	/* v4l2 devices */
> > > +	struct v4l2_device	v4l2_dev;
> > > +	struct video_device	vfd;
> > > +	/* mutex for the v4l2 device */
> > > +	struct mutex		dev_mutex;
> > > +	atomic_t		num_inst;
> > > +
> > > +	/* allocated mmal instance and components */
> > > +	enum bcm2835_codec_role	role;
> > > +	/* The list of formats supported on input and output queues. */
> > > +	struct bcm2835_codec_fmt_list	supported_fmts[2];
> > > +
> > > +	/*
> > > +	 * Max size supported varies based on role. Store during
> > > +	 * bcm2835_codec_create for use later.
> > > +	 */
> > > +	unsigned int max_w;
> > > +	unsigned int max_h;
> > > +
> > > +	struct vchiq_mmal_instance	*instance;
> > > +
> > > +	struct v4l2_m2m_dev	*m2m_dev;
> > > +};
> > > +
> > > +struct bcm2835_codec_ctx {
> > > +	struct v4l2_fh		fh;
> > > +	struct bcm2835_codec_dev	*dev;
> > > +
> > > +	struct v4l2_ctrl_handler hdl;
> > > +	struct v4l2_ctrl *gop_size;
> > > +
> > > +	struct vchiq_mmal_component  *component;
> > > +	bool component_enabled;
> > > +
> > > +	enum v4l2_colorspace	colorspace;
> > > +	enum v4l2_ycbcr_encoding ycbcr_enc;
> > > +	enum v4l2_xfer_func	xfer_func;
> > > +	enum v4l2_quantization	quant;
> > > +
> > > +	int hflip;
> > > +	int vflip;
> > > +
> > > +	/* Source and destination queue data */
> > > +	struct bcm2835_codec_q_data   q_data[2];
> > > +	s32  bitrate;
> > > +	unsigned int	framerate_num;
> > > +	unsigned int	framerate_denom;
> > > +
> > > +	bool aborting;
> > > +	int num_ip_buffers;
> > > +	int num_op_buffers;
> > > +	struct completion frame_cmplt;
> > > +};
> > > +
> > > +struct bcm2835_codec_driver {
> > > +	struct vchiq_device	*device;
> > > +	struct media_device	mdev;
> > > +
> > > +	struct bcm2835_codec_dev *encode;
> > > +	struct bcm2835_codec_dev *decode;
> > > +	struct bcm2835_codec_dev *isp;
> > > +	struct bcm2835_codec_dev *deinterlace;
> > > +	struct bcm2835_codec_dev *encode_image;
> > > +};
> > > +
> > > +enum {
> > > +	V4L2_M2M_SRC =3D 0,
> > > +	V4L2_M2M_DST =3D 1,
> > > +};
> > > +
> > > +static const struct bcm2835_codec_fmt *get_fmt(u32 mmal_fmt)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(supported_formats); i++) {
> > > +		if (supported_formats[i].mmal_fmt =3D=3D mmal_fmt &&
> > > +		    (!disable_bayer || !supported_formats[i].is_bayer))
> > > +			return &supported_formats[i];
> > > +	}
> > > +	return NULL;
> > > +}
> > > +
> > > +static inline
> > > +struct bcm2835_codec_fmt_list *get_format_list(struct=20
> > > bcm2835_codec_dev *dev,
> > > +					       bool capture)
> > > +{
> > > +	return &dev->supported_fmts[capture ? 1 : 0];
> > > +}
> > > +
> > > +static
> > > +struct bcm2835_codec_fmt *get_default_format(struct bcm2835_codec_de=
v=20
> > > *dev,
> > > +					     bool capture)
> > > +{
> > > +	return &dev->supported_fmts[capture ? 1 : 0].list[0];
> > > +}
> > > +
> > > +static
> > > +struct bcm2835_codec_fmt *find_format_pix_fmt(u32 pix_fmt,
> > > +					      struct bcm2835_codec_dev *dev,
> > > +					      bool capture)
> > > +{
> > > +	struct bcm2835_codec_fmt *fmt;
> > > +	unsigned int k;
> > > +	struct bcm2835_codec_fmt_list *fmts =3D
> > > +					&dev->supported_fmts[capture ? 1 : 0];
> > > +
> > > +	for (k =3D 0; k < fmts->num_entries; k++) {
> > > +		fmt =3D &fmts->list[k];
> > > +		if (fmt->fourcc =3D=3D pix_fmt)
> > > +			break;
> > > +	}
> > > +	if (k =3D=3D fmts->num_entries)
> > > +		return NULL;
> > > +
> > > +	return &fmts->list[k];
> > > +}
> > > +
> > > +static inline
> > > +struct bcm2835_codec_fmt *find_format(struct v4l2_format *f,
> > > +				      struct bcm2835_codec_dev *dev,
> > > +				      bool capture)
> > > +{
> > > +	return find_format_pix_fmt(f->fmt.pix_mp.pixelformat, dev, capture)=
;
> > > +}
> > > +
> > > +static inline struct bcm2835_codec_ctx *file2ctx(struct file *file)
> > > +{
> > > +	return container_of(file->private_data, struct bcm2835_codec_ctx,=
=20
> > > fh);
> > > +}
> > > +
> > > +static struct bcm2835_codec_q_data *get_q_data(struct=20
> > > bcm2835_codec_ctx *ctx,
> > > +					       enum v4l2_buf_type type)
> > > +{
> > > +	switch (type) {
> > > +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > > +		return &ctx->q_data[V4L2_M2M_SRC];
> > > +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > > +		return &ctx->q_data[V4L2_M2M_DST];
> > > +	default:
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "%s: Invalid queue type %u\n",
> > > +			 __func__, type);
> > > +		break;
> > > +	}
> > > +	return NULL;
> > > +}
> > > +
> > > +static struct vchiq_mmal_port *get_port_data(struct bcm2835_codec_ct=
x=20
> > > *ctx,
> > > +					     enum v4l2_buf_type type)
> > > +{
> > > +	if (!ctx->component)
> > > +		return NULL;
> > > +
> > > +	switch (type) {
> > > +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > > +		return &ctx->component->input[0];
> > > +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > > +		return &ctx->component->output[0];
> > > +	default:
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "%s: Invalid queue type %u\n",
> > > +			 __func__, type);
> > > +		break;
> > > +	}
> > > +	return NULL;
> > > +}
> > > +
> > > +/*
> > > + * mem2mem callbacks
> > > + */
> > > +
> > > +/*
> > > + * job_ready() - check whether an instance is ready to be scheduled=
=20
> > > to run
> > > + */
> > > +static int job_ready(void *priv)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D priv;
> > > +
> > > +	if (!v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) &&
> > > +	    !v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx))
> > > +		return 0;
> > > +
> > > +	return 1;
> > > +}
> > > +
> > > +static void job_abort(void *priv)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D priv;
> > > +
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s\n", __func__);
> > > +	/* Will cancel the transaction in the next interrupt handler */
> > > +	ctx->aborting =3D 1;
> > > +}
> > > +
> > > +static inline unsigned int get_sizeimage(int bpl, int width, int=20
> > > height,
> > > +					 struct bcm2835_codec_fmt *fmt)
> > > +{
> > > +	if (fmt->flags & V4L2_FMT_FLAG_COMPRESSED) {
> > > +		if (fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > > +			return DEF_COMP_BUF_SIZE_JPEG;
> > > +
> > > +		if (width * height > 1280 * 720)
> > > +			return DEF_COMP_BUF_SIZE_GREATER_720P;
> > > +		else
> > > +			return DEF_COMP_BUF_SIZE_720P_OR_LESS;
> > > +	}
> > > +
> > > +	if (fmt->fourcc !=3D V4L2_PIX_FMT_NV12_COL128)
> > > +		return (bpl * height * fmt->size_multiplier_x2) >> 1;
> > > +
> > > +	/*
> > > +	 * V4L2_PIX_FMT_NV12_COL128 is 128 pixel wide columns.
> > > +	 * bytesperline is the column stride in lines, so multiply by
> > > +	 * the number of columns and 128.
> > > +	 */
> > > +	return (ALIGN(width, 128) * bpl);
> >=20
> > I'd like to see these into v4l2-common, though you seem to have made a=
=20
> > good
> > effort to avoid duplicating it.
>=20
> I'll try...
>=20
> > > +}
> > > +
> > > +static inline unsigned int get_bytesperline(int width, int height,
> > > +					    struct bcm2835_codec_fmt *fmt,
> > > +					    enum bcm2835_codec_role role)
> > > +{
> > > +	if (fmt->fourcc !=3D V4L2_PIX_FMT_NV12_COL128)
> > > +		return ALIGN((width * fmt->depth) >> 3,
> > > +			     fmt->bytesperline_align[role]);
> > > +
> > > +	/*
> > > +	 * V4L2_PIX_FMT_NV12_COL128 passes the column stride in lines via
> > > +	 * bytesperline.
> > > +	 * The minimum value for this is sufficient for the base luma and=
=20
> > > chroma
> > > +	 * with no padding.
> > > +	 */
> > > +	return (height * 3) >> 1;
> >=20
> > I'm not sure for multiplanar format, but I'll assume this is single=20
> > allocaiton
> > since you named it NV12 rather then NV12M. In single allocation=20
> > formats, it is
> > requires that the plane size matches:
> >=20
> >   bytesperline * height
> >=20
> > It seems like you are not respecting this rules, I will try and comment=
=20
> > against
> > the original format definition. If its a multi-allocation format, maybe=
=20
> > we can
> > skip that rule, but I'm not very keen too personally. I'll have to=20
> > review the
> > associated format definition to comment further, but I sense there is a=
=20
> > conflict
> > with best practices.
>=20
> I noted your comment on the original format definition.
>=20
> > > +}
> > > +
> > > +static void setup_mmal_port_format(struct bcm2835_codec_ctx *ctx,
> > > +				   struct bcm2835_codec_q_data *q_data,
> > > +				   struct vchiq_mmal_port *port)
> > > +{
> > > +	port->format.encoding =3D q_data->fmt->mmal_fmt;
> > > +	port->format.flags =3D 0;
> > > +
> > > +	if (!(q_data->fmt->flags & V4L2_FMT_FLAG_COMPRESSED)) {
> > > +		if (q_data->fmt->mmal_fmt !=3D MMAL_ENCODING_YUVUV128) {
> > > +			/* Raw image format - set width/height */
> > > +			port->es.video.width =3D (q_data->bytesperline << 3) /
> > > +							q_data->fmt->depth;
> > > +			port->es.video.height =3D q_data->height;
> > > +			port->es.video.crop.width =3D q_data->crop_width;
> > > +			port->es.video.crop.height =3D q_data->crop_height;
> > > +		} else {
> > > +			/* NV12_COL128 / YUVUV128 column format */
> > > +			/* Column stride in lines */
> > > +			port->es.video.width =3D q_data->bytesperline;
> > > +			port->es.video.height =3D q_data->height;
> > > +			port->es.video.crop.width =3D q_data->crop_width;
> > > +			port->es.video.crop.height =3D q_data->crop_height;
> > > +			port->format.flags =3D=20
> > > MMAL_ES_FORMAT_FLAG_COL_FMTS_WIDTH_IS_COL_STRIDE;
> > > +		}
> > > +		port->es.video.frame_rate.numerator =3D ctx->framerate_num;
> > > +		port->es.video.frame_rate.denominator =3D ctx->framerate_denom;
> > > +	} else {
> > > +		/* Compressed format - leave resolution as 0 for decode */
> > > +		if (ctx->dev->role =3D=3D DECODE) {
> > > +			port->es.video.width =3D 0;
> > > +			port->es.video.height =3D 0;
> > > +			port->es.video.crop.width =3D 0;
> > > +			port->es.video.crop.height =3D 0;
> > > +		} else {
> > > +			port->es.video.width =3D q_data->crop_width;
> > > +			port->es.video.height =3D q_data->height;
> > > +			port->es.video.crop.width =3D q_data->crop_width;
> > > +			port->es.video.crop.height =3D q_data->crop_height;
> > > +			port->format.bitrate =3D ctx->bitrate;
> > > +			port->es.video.frame_rate.numerator =3D ctx->framerate_num;
> > > +			port->es.video.frame_rate.denominator =3D ctx->framerate_denom;
> > > +		}
> > > +	}
> > > +	port->es.video.crop.x =3D 0;
> > > +	port->es.video.crop.y =3D 0;
> > > +
> > > +	port->current_buffer.size =3D q_data->sizeimage;
> > > +};
> > > +
> > > +static void ip_buffer_cb(struct vchiq_mmal_instance *instance,
> > > +			 struct vchiq_mmal_port *port, int status,
> > > +			 struct mmal_buffer *mmal_buf)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D port->cb_ctx/*, *curr_ctx*/;
> > > +	struct m2m_mmal_buffer *buf =3D
> > > +			container_of(mmal_buf, struct m2m_mmal_buffer, mmal);
> > > +
> > > +	v4l2_dbg(2, debug, &ctx->dev->v4l2_dev, "%s: port %p buf %p length=
=20
> > > %lu, flags %x\n",
> > > +		 __func__, port, mmal_buf, mmal_buf->length,
> > > +		 mmal_buf->mmal_flags);
> > > +
> > > +	if (buf =3D=3D &ctx->q_data[V4L2_M2M_SRC].eos_buffer) {
> > > +		/* Do we need to add lcoking to prevent multiple submission of
> >=20
> > Fake this a fixme perhaps ? also lcoking -> locking
>=20
> I'm not 100% sure what you mean here; do you mean this is a hidden #=20
> FIXME: comment?


I fat fingered that one, I meant maybe we should try and fix this issue if =
it
actually exist ? Locking fixme are rather scary to see.

>=20
> > > +		 * the EOS, and therefore handle mutliple return here?
> > > +		 */
> > > +		v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: eos buffer=20
> > > returned.\n",
> > > +			 __func__);
> > > +		ctx->q_data[V4L2_M2M_SRC].eos_buffer_in_use =3D false;
> > > +		return;
> > > +	}
> > > +
> > > +	if (status) {
> > > +		/* error in transfer */
> > > +		if (buf)
> > > +			/* there was a buffer with the error so return it */
> > > +			vb2_buffer_done(&buf->m2m.vb.vb2_buf,
> > > +					VB2_BUF_STATE_ERROR);
> > > +		return;
> > > +	}
> > > +	if (mmal_buf->cmd) {
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "%s: Not expecting cmd msgs on ip=
=20
> > > callback - %08x\n",
> > > +			 __func__, mmal_buf->cmd);
> > > +		/*
> > > +		 * CHECKME: Should we return here. The buffer shouldn't have a
> > > +		 * message context or vb2 buf associated.
> > > +		 */
> > > +	}
> > > +
> > > +	v4l2_dbg(3, debug, &ctx->dev->v4l2_dev, "%s: no error. Return buffe=
r=20
> > > %p\n",
> > > +		 __func__, &buf->m2m.vb.vb2_buf);
> > > +	vb2_buffer_done(&buf->m2m.vb.vb2_buf,
> > > +			port->enabled ? VB2_BUF_STATE_DONE :
> > > +					VB2_BUF_STATE_QUEUED);
> > > +
> > > +	ctx->num_ip_buffers++;
> > > +	v4l2_dbg(2, debug, &ctx->dev->v4l2_dev, "%s: done %d input=20
> > > buffers\n",
> > > +		 __func__, ctx->num_ip_buffers);
> > > +
> > > +	if (!port->enabled && atomic_read(&port->buffers_with_vpu))
> > > +		complete(&ctx->frame_cmplt);
> > > +}
> > > +
> > > +static void queue_res_chg_event(struct bcm2835_codec_ctx *ctx)
> > > +{
> > > +	static const struct v4l2_event ev_src_ch =3D {
> > > +		.type =3D V4L2_EVENT_SOURCE_CHANGE,
> > > +		.u.src_change.changes =3D
> > > +		V4L2_EVENT_SRC_CH_RESOLUTION,
> > > +	};
> > > +
> > > +	v4l2_event_queue_fh(&ctx->fh, &ev_src_ch);
> > > +}
> > > +
> > > +static void send_eos_event(struct bcm2835_codec_ctx *ctx)
> > > +{
> > > +	static const struct v4l2_event ev =3D {
> > > +		.type =3D V4L2_EVENT_EOS,
> > > +	};
> > > +
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "Sending EOS event\n");
> > > +
> > > +	v4l2_event_queue_fh(&ctx->fh, &ev);
> > > +}
> > > +
> > > +static void color_mmal2v4l(struct bcm2835_codec_ctx *ctx, u32=20
> > > encoding,
> > > +			   u32 color_space)
> > > +{
> > > +	int is_rgb;
> > > +
> > > +	switch (encoding) {
> > > +	case MMAL_ENCODING_I420:
> > > +	case MMAL_ENCODING_YV12:
> > > +	case MMAL_ENCODING_NV12:
> > > +	case MMAL_ENCODING_NV21:
> > > +	case V4L2_PIX_FMT_YUYV:
> > > +	case V4L2_PIX_FMT_YVYU:
> > > +	case V4L2_PIX_FMT_UYVY:
> > > +	case V4L2_PIX_FMT_VYUY:
> > > +		/* YUV based colourspaces */
> > > +		switch (color_space) {
> > > +		case MMAL_COLOR_SPACE_ITUR_BT601:
> > > +			ctx->colorspace =3D V4L2_COLORSPACE_SMPTE170M;
> > > +			break;
> > > +
> > > +		case MMAL_COLOR_SPACE_ITUR_BT709:
> > > +			ctx->colorspace =3D V4L2_COLORSPACE_REC709;
> > > +			break;
> > > +		default:
> > > +			break;
> > > +		}
> > > +		break;
> > > +	default:
> > > +		/* RGB based colourspaces */
> > > +		ctx->colorspace =3D V4L2_COLORSPACE_SRGB;
> > > +		break;
> > > +	}
> > > +	ctx->xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(ctx->colorspace);
> > > +	ctx->ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(ctx->colorspace);
> > > +	is_rgb =3D ctx->colorspace =3D=3D V4L2_COLORSPACE_SRGB;
> > > +	ctx->quant =3D V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb, ctx->colorspac=
e,
> > > +						   ctx->ycbcr_enc);
> > > +}
> > > +
> > > +static void handle_fmt_changed(struct bcm2835_codec_ctx *ctx,
> > > +			       struct mmal_buffer *mmal_buf)
> > > +{
> > > +	struct bcm2835_codec_q_data *q_data;
> > > +	struct mmal_msg_event_format_changed *format =3D
> > > +		(struct mmal_msg_event_format_changed *)mmal_buf->buffer;
> > > +	struct mmal_parameter_video_interlace_type interlace;
> > > +	int interlace_size =3D sizeof(interlace);
> > > +	struct vb2_queue *vq;
> > > +	int ret;
> > > +
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: Format changed: buff=
=20
> > > size min %u, rec %u, buff num min %u, rec %u\n",
> > > +		 __func__,
> > > +		 format->buffer_size_min,
> > > +		 format->buffer_size_recommended,
> > > +		 format->buffer_num_min,
> > > +		 format->buffer_num_recommended
> > > +		);
> > > +	if (format->format.type !=3D MMAL_ES_TYPE_VIDEO) {
> > > +		v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: Format changed but no=
t=20
> > > video %u\n",
> > > +			 __func__, format->format.type);
> > > +		return;
> > > +	}
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: Format changed to=20
> > > %ux%u, crop %ux%u, colourspace %08X\n",
> > > +		 __func__, format->es.video.width, format->es.video.height,
> > > +		 format->es.video.crop.width, format->es.video.crop.height,
> > > +		 format->es.video.color_space);
> > > +
> > > +	q_data =3D get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: Format was %ux%u, crop=
=20
> > > %ux%u\n",
> > > +		 __func__, q_data->bytesperline, q_data->height,
> > > +		 q_data->crop_width, q_data->crop_height);
> > > +
> > > +	q_data->crop_width =3D format->es.video.crop.width;
> > > +	q_data->crop_height =3D format->es.video.crop.height;
> > > +	/*
> > > +	 * Stop S_FMT updating crop_height should it be unaligned.
> > > +	 * Client can still update the crop region via S_SELECTION should i=
t
> > > +	 * really want to, but the decoder is likely to complain that the
> > > +	 * format then doesn't match.
> > > +	 */
> > > +	q_data->selection_set =3D true;
> > > +	q_data->bytesperline =3D get_bytesperline(format->es.video.width,
> > > +						format->es.video.height,
> > > +						q_data->fmt, ctx->dev->role);
> > > +
> > > +	q_data->height =3D format->es.video.height;
> > > +	q_data->sizeimage =3D format->buffer_size_min;
> > > +	if (format->es.video.color_space)
> > > +		color_mmal2v4l(ctx, format->format.encoding,
> > > +			       format->es.video.color_space);
> > > +
> > > +	q_data->aspect_ratio.numerator =3D format->es.video.par.numerator;
> > > +	q_data->aspect_ratio.denominator =3D format->es.video.par.denominat=
or;
> > > +
> > > +	ret =3D vchiq_mmal_port_parameter_get(ctx->dev->instance,
> > > +					    &ctx->component->output[0],
> > > +					    MMAL_PARAMETER_VIDEO_INTERLACE_TYPE,
> > > +					    &interlace,
> > > +					    &interlace_size);
> > > +	if (!ret) {
> > > +		switch (interlace.mode) {
> > > +		case MMAL_INTERLACE_PROGRESSIVE:
> > > +		default:
> > > +			q_data->field =3D V4L2_FIELD_NONE;
> > > +			break;
> > > +		case MMAL_INTERLACE_FIELDS_INTERLEAVED_UPPER_FIRST:
> > > +			q_data->field =3D V4L2_FIELD_INTERLACED_TB;
> > > +			break;
> > > +		case MMAL_INTERLACE_FIELDS_INTERLEAVED_LOWER_FIRST:
> > > +			q_data->field =3D V4L2_FIELD_INTERLACED_BT;
> > > +			break;
> > > +		}
> > > +		v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: interlace mode %u,=
=20
> > > v4l2 field %u\n",
> > > +			 __func__, interlace.mode, q_data->field);
> > > +	} else {
> > > +		q_data->field =3D V4L2_FIELD_NONE;
> > > +	}
> > > +
> > > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,=20
> > > V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > > +	if (vq->streaming)
> > > +		vq->last_buffer_dequeued =3D true;
> > > +
> > > +	queue_res_chg_event(ctx);
> > > +}
> > > +
> > > +static void op_buffer_cb(struct vchiq_mmal_instance *instance,
> > > +			 struct vchiq_mmal_port *port, int status,
> > > +			 struct mmal_buffer *mmal_buf)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D port->cb_ctx;
> > > +	enum vb2_buffer_state buf_state =3D VB2_BUF_STATE_DONE;
> > > +	struct m2m_mmal_buffer *buf;
> > > +	struct vb2_v4l2_buffer *vb2;
> > > +
> > > +	v4l2_dbg(2, debug, &ctx->dev->v4l2_dev,
> > > +		 "%s: status:%d, buf:%p, length:%lu, flags %04x, pts %lld\n",
> > > +		 __func__, status, mmal_buf, mmal_buf->length,
> > > +		 mmal_buf->mmal_flags, mmal_buf->pts);
> > > +
> > > +	buf =3D container_of(mmal_buf, struct m2m_mmal_buffer, mmal);
> > > +	vb2 =3D &buf->m2m.vb;
> > > +
> > > +	if (status) {
> > > +		/* error in transfer */
> > > +		if (vb2) {
> > > +			/* there was a buffer with the error so return it */
> > > +			vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_ERROR);
> > > +		}
> > > +		return;
> > > +	}
> > > +
> > > +	if (mmal_buf->cmd) {
> > > +		switch (mmal_buf->cmd) {
> > > +		case MMAL_EVENT_FORMAT_CHANGED:
> > > +		{
> > > +			handle_fmt_changed(ctx, mmal_buf);
> > > +			break;
> > > +		}
> > > +		default:
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Unexpected event on output=20
> > > callback - %08x\n",
> > > +				 __func__, mmal_buf->cmd);
> > > +			break;
> > > +		}
> > > +		return;
> > > +	}
> > > +
> > > +	v4l2_dbg(3, debug, &ctx->dev->v4l2_dev, "%s: length %lu, flags %x,=
=20
> > > idx %u\n",
> > > +		 __func__, mmal_buf->length, mmal_buf->mmal_flags,
> > > +		 vb2->vb2_buf.index);
> > > +
> > > +	if (mmal_buf->length =3D=3D 0) {
> > > +		/* stream ended, or buffer being returned during disable. */
> > > +		v4l2_dbg(2, debug, &ctx->dev->v4l2_dev, "%s: Empty buffer - flags=
=20
> > > %04x",
> > > +			 __func__, mmal_buf->mmal_flags);
> > > +		if (!(mmal_buf->mmal_flags & MMAL_BUFFER_HEADER_FLAG_EOS)) {
> > > +			if (!port->enabled) {
> > > +				vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_QUEUED);
> > > +				if (atomic_read(&port->buffers_with_vpu))
> > > +					complete(&ctx->frame_cmplt);
> > > +			} else {
> > > +				vchiq_mmal_submit_buffer(ctx->dev->instance,
> > > +							 &ctx->component->output[0],
> > > +							 mmal_buf);
> > > +			}
> > > +			return;
> > > +		}
> > > +	}
> > > +	if (mmal_buf->mmal_flags & MMAL_BUFFER_HEADER_FLAG_EOS) {
> > > +		/* EOS packet from the VPU */
> > > +		send_eos_event(ctx);
> > > +		vb2->flags |=3D V4L2_BUF_FLAG_LAST;
> > > +	}
> > > +
> > > +	if (mmal_buf->mmal_flags & MMAL_BUFFER_HEADER_FLAG_CORRUPTED)
> > > +		buf_state =3D VB2_BUF_STATE_ERROR;
> > > +
> > > +	/* vb2 timestamps in nsecs, mmal in usecs */
> > > +	vb2->vb2_buf.timestamp =3D mmal_buf->pts * 1000;
> >=20
> > M2M drivers are not allowed to "interpret" the timesamp field. They can=
=20
> > only
> > copy it over. This scaling of the timestamp seems problematic and may=
=20
> > possibly
> > impair some userspace ability to match in and out buffers. Is there=20
> > some other
> > user data that could be use to maintain the lower bits ?
> >=20
> > I realized that it should not have worked for GStreamer, since it uses=
=20
> > a frame
> > counter as timestamp (and no real timestamp), but accidentally, it only=
=20
> > uses
> > tv_sec member (with a implicit cast from signed to unsigned, but lets=
=20
> > not grab
> > other projects issues in, unlike stateless, there is a single=20
> > representation of
> > it, so its less of an issue).
> >=20
> > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subproje=
cts/gst-plugins-good/sys/v4l2/gstv4l2bufferpool.c?ref_type=3Dheads#L1179
> >=20
> > There is no requirement in the spec that tells userspace using forward=
=20
> > counters
> > to only use the seconds, so I suppose this is far from ideal.
>=20
> You mean that vb2_buf.timestamp is not necessarily a time-based=20
> timestamp? I'll have to see how mmal is using the pts.

Correct, its opaque data from user, the spec only defines the transfer rule=
s for
that data in the case that a frame is duplicated or merged.

>=20
> > > +
> > > +	vb2_set_plane_payload(&vb2->vb2_buf, 0, mmal_buf->length);
> > > +	switch (mmal_buf->mmal_flags &
> > > +				(MMAL_BUFFER_HEADER_VIDEO_FLAG_INTERLACED |
> > > +				 MMAL_BUFFER_HEADER_VIDEO_FLAG_TOP_FIELD_FIRST)) {
> > > +	case 0:
> > > +	case MMAL_BUFFER_HEADER_VIDEO_FLAG_TOP_FIELD_FIRST: /* Bogus */
> > > +		vb2->field =3D V4L2_FIELD_NONE;
> > > +		break;
> > > +	case MMAL_BUFFER_HEADER_VIDEO_FLAG_INTERLACED:
> > > +		vb2->field =3D V4L2_FIELD_INTERLACED_BT;
> > > +		break;
> > > +	case (MMAL_BUFFER_HEADER_VIDEO_FLAG_INTERLACED |
> > > +	      MMAL_BUFFER_HEADER_VIDEO_FLAG_TOP_FIELD_FIRST):
> > > +		vb2->field =3D V4L2_FIELD_INTERLACED_TB;
> > > +		break;
> > > +	}
> > > +
> > > +	if (mmal_buf->mmal_flags & MMAL_BUFFER_HEADER_FLAG_KEYFRAME)
> > > +		vb2->flags |=3D V4L2_BUF_FLAG_KEYFRAME;
> > > +
> > > +	vb2_buffer_done(&vb2->vb2_buf, buf_state);
> > > +	ctx->num_op_buffers++;
> > > +
> > > +	v4l2_dbg(2, debug, &ctx->dev->v4l2_dev, "%s: done %d output=20
> > > buffers\n",
> > > +		 __func__, ctx->num_op_buffers);
> > > +
> > > +	if (!port->enabled && atomic_read(&port->buffers_with_vpu))
> > > +		complete(&ctx->frame_cmplt);
> > > +}
> > > +
> > > +/* vb2_to_mmal_buffer() - converts vb2 buffer header to MMAL
> > > + *
> > > + * Copies all the required fields from a VB2 buffer to the MMAL=20
> > > buffer header,
> > > + * ready for sending to the VPU.
> > > + */
> > > +static void vb2_to_mmal_buffer(struct m2m_mmal_buffer *buf,
> > > +			       struct vb2_v4l2_buffer *vb2)
> > > +{
> > > +	u64 pts;
> > > +
> > > +	buf->mmal.mmal_flags =3D 0;
> > > +	if (vb2->flags & V4L2_BUF_FLAG_KEYFRAME)
> > > +		buf->mmal.mmal_flags |=3D MMAL_BUFFER_HEADER_FLAG_KEYFRAME;
> > > +
> > > +	/*
> > > +	 * Adding this means that the data must be framed correctly as one=
=20
> > > frame
> > > +	 * per buffer. The underlying decoder has no such requirement, but=
=20
> > > it
> > > +	 * will reduce latency as the bistream parser will be kicked=20
> > > immediately
> > > +	 * to parse the frame, rather than relying on its own heuristics fo=
r
> > > +	 * when to wake up.
> > > +	 */
> > > +	buf->mmal.mmal_flags |=3D MMAL_BUFFER_HEADER_FLAG_FRAME_END;
> >=20
> > We do the same in wave5, in fact, we could not reliably implement m2m=
=20
> > jobs and
> > power management. Though, as you have no ring buffer, are you able to=
=20
> > replay
> > multiple buffer when an incomplete frame is detected ? Or does it means=
=20
> > you
> > don't support multiple qbuf per frames ? Not a defect though, the spec=
=20
> > makes
> > this encouraged by optional really.
>=20
> This goes over my head, I'll have to read up on this, this might be fw=
=20
> specific?

I suppose its fine to ignore in the context of this up-streaming work.

>=20
> > > +
> > > +	buf->mmal.length =3D vb2->vb2_buf.planes[0].bytesused;
> > > +	/*
> > > +	 * Minor ambiguity in the V4L2 spec as to whether passing in a 0=
=20
> > > length
> > > +	 * buffer, or one with V4L2_BUF_FLAG_LAST set denotes end of stream=
.
> > > +	 * Handle either.
> > > +	 */
> >=20
> > Zero length EOS method is deprecated and the framework prevents it by=
=20
> > default.
> > If you strictly need to support such userspace, your driver should set
> > q->allow_zero_bytesused. Note that this is normally not expected in=20
> > newly
> > written driver.
>=20
> I guess probably not.
>=20
> > > +	if (!buf->mmal.length || vb2->flags & V4L2_BUF_FLAG_LAST)
> > > +		buf->mmal.mmal_flags |=3D MMAL_BUFFER_HEADER_FLAG_EOS;
> > > +
> > > +	/* vb2 timestamps in nsecs, mmal in usecs */
> > > +	pts =3D vb2->vb2_buf.timestamp;
> > > +	do_div(pts, 1000);
> > > +	buf->mmal.pts =3D pts;
> > > +	buf->mmal.dts =3D MMAL_TIME_UNKNOWN;
> >=20
> > PTS division here, lost of data.
>=20
> yeah, if the timestamp is not nsec, that would be problematic.
>=20
> > > +
> > > +	switch (field_override ? field_override : vb2->field) {
> > > +	default:
> > > +	case V4L2_FIELD_NONE:
> > > +		break;
> > > +	case V4L2_FIELD_INTERLACED_BT:
> > > +		buf->mmal.mmal_flags |=3D MMAL_BUFFER_HEADER_VIDEO_FLAG_INTERLACED=
;
> > > +		break;
> > > +	case V4L2_FIELD_INTERLACED_TB:
> > > +		buf->mmal.mmal_flags |=3D MMAL_BUFFER_HEADER_VIDEO_FLAG_INTERLACED=
 |
> > > +					MMAL_BUFFER_HEADER_VIDEO_FLAG_TOP_FIELD_FIRST;
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +/* device_run() - prepares and starts the device
> > > + *
> > > + * This simulates all the immediate preparations required before=20
> > > starting
> > > + * a device. This will be called by the framework when it decides to=
=20
> > > schedule
> > > + * a particular instance.
> > > + */
> > > +static void device_run(void *priv)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D priv;
> > > +	struct bcm2835_codec_dev *dev =3D ctx->dev;
> > > +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > > +	struct m2m_mmal_buffer *src_m2m_buf =3D NULL, *dst_m2m_buf =3D NULL=
;
> > > +	struct v4l2_m2m_buffer *m2m;
> > > +	int ret;
> > > +
> > > +	v4l2_dbg(3, debug, &ctx->dev->v4l2_dev, "%s: off we go\n",=20
> > > __func__);
> > > +
> > > +	if (ctx->fh.m2m_ctx->out_q_ctx.q.streaming) {
> >=20
> > The frameworks currently hardcode the requirement that the output queue=
=20
> > is
> > streaming in order for device_run to be called. For this reason, this=
=20
> > check is
> > always true.
>=20
> Then we can remove this check.
>=20
> > > +		src_buf =3D v4l2_m2m_buf_remove(&ctx->fh.m2m_ctx->out_q_ctx);
> > > +		if (src_buf) {
> > > +			m2m =3D container_of(src_buf, struct v4l2_m2m_buffer, vb);
> > > +			src_m2m_buf =3D container_of(m2m, struct m2m_mmal_buffer,
> > > +						   m2m);
> > > +			vb2_to_mmal_buffer(src_m2m_buf, src_buf);
> > > +
> > > +			ret =3D vchiq_mmal_submit_buffer(dev->instance,
> > > +						       &ctx->component->input[0],
> > > +						       &src_m2m_buf->mmal);
> > > +			v4l2_dbg(3, debug, &ctx->dev->v4l2_dev,
> > > +				 "%s: Submitted ip buffer len %lu, pts %llu, flags %04x\n",
> > > +				 __func__, src_m2m_buf->mmal.length,
> > > +				 src_m2m_buf->mmal.pts,
> > > +				 src_m2m_buf->mmal.mmal_flags);
> > > +			if (ret)
> > > +				v4l2_err(&ctx->dev->v4l2_dev,
> > > +					 "%s: Failed submitting ip buffer\n",
> > > +					 __func__);
> > > +		}
> > > +	}
> > > +
> > > +	if (ctx->fh.m2m_ctx->cap_q_ctx.q.streaming) {
> > > +		dst_buf =3D v4l2_m2m_buf_remove(&ctx->fh.m2m_ctx->cap_q_ctx);
> > > +		if (dst_buf) {
> > > +			m2m =3D container_of(dst_buf, struct v4l2_m2m_buffer, vb);
> > > +			dst_m2m_buf =3D container_of(m2m, struct m2m_mmal_buffer,
> > > +						   m2m);
> > > +			vb2_to_mmal_buffer(dst_m2m_buf, dst_buf);
> > > +
> > > +			v4l2_dbg(3, debug, &ctx->dev->v4l2_dev,
> > > +				 "%s: Submitted op buffer\n", __func__);
> > > +			ret =3D vchiq_mmal_submit_buffer(dev->instance,
> > > +						       &ctx->component->output[0],
> > > +						       &dst_m2m_buf->mmal);
> > > +			if (ret)
> > > +				v4l2_err(&ctx->dev->v4l2_dev,
> > > +					 "%s: Failed submitting op buffer\n",
> > > +					 __func__);
> > > +		}
> > > +	}
> > > +
> > > +	v4l2_dbg(3, debug, &ctx->dev->v4l2_dev, "%s: Submitted src %p, dst=
=20
> > > %p\n",
> > > +		 __func__, src_m2m_buf, dst_m2m_buf);
> > > +
> > > +	/* Complete the job here. */
> > > +	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
> > > +}
> > > +
> > > +/*
> > > + * video ioctls
> > > + */
> > > +static int vidioc_querycap(struct file *file, void *priv,
> > > +			   struct v4l2_capability *cap)
> > > +{
> > > +	struct bcm2835_codec_dev *dev =3D video_drvdata(file);
> > > +
> > > +	strncpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver) - 1);
> > > +	strncpy(cap->card, dev->vfd.name, sizeof(cap->card) - 1);
> > > +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> > > +		 MEM2MEM_NAME);
> >=20
> > You can drop this line, it will be filled for you.
>=20
> I assume you meant the bus_info only?

buf_info only indeed.

>=20
> > > +	return 0;
> > > +}
> > > +
> > > +static int enum_fmt(struct v4l2_fmtdesc *f, struct bcm2835_codec_ctx=
=20
> > > *ctx,
> > > +		    bool capture)
> > > +{
> > > +	struct bcm2835_codec_fmt *fmt;
> > > +	struct bcm2835_codec_fmt_list *fmts =3D
> > > +					get_format_list(ctx->dev, capture);
> > > +
> > > +	if (f->index < fmts->num_entries) {
> > > +		/* Format found */
> > > +		fmt =3D &fmts->list[f->index];
> > > +		f->pixelformat =3D fmt->fourcc;
> > > +		f->flags =3D fmt->flags;
> > > +		return 0;
> > > +	}
> > > +
> > > +	/* Format not found */
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
> > > +				   struct v4l2_fmtdesc *f)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +
> > > +	return enum_fmt(f, ctx, true);
> > > +}
> > > +
> > > +static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
> > > +				   struct v4l2_fmtdesc *f)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +
> > > +	return enum_fmt(f, ctx, false);
> > > +}
> > > +
> > > +static int vidioc_g_fmt(struct bcm2835_codec_ctx *ctx, struct=20
> > > v4l2_format *f)
> > > +{
> > > +	struct vb2_queue *vq;
> > > +	struct bcm2835_codec_q_data *q_data;
> > > +
> > > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > > +	if (!vq)
> > > +		return -EINVAL;
> > > +
> > > +	q_data =3D get_q_data(ctx, f->type);
> > > +
> > > +	f->fmt.pix_mp.width			=3D q_data->crop_width;
> > > +	f->fmt.pix_mp.height			=3D q_data->height;
> > > +	f->fmt.pix_mp.pixelformat		=3D q_data->fmt->fourcc;
> > > +	f->fmt.pix_mp.field			=3D q_data->field;
> > > +	f->fmt.pix_mp.colorspace		=3D ctx->colorspace;
> > > +	f->fmt.pix_mp.plane_fmt[0].sizeimage	=3D q_data->sizeimage;
> > > +	f->fmt.pix_mp.plane_fmt[0].bytesperline	=3D q_data->bytesperline;
> > > +	f->fmt.pix_mp.num_planes		=3D 1;
> > > +	f->fmt.pix_mp.ycbcr_enc			=3D ctx->ycbcr_enc;
> > > +	f->fmt.pix_mp.quantization		=3D ctx->quant;
> > > +	f->fmt.pix_mp.xfer_func			=3D ctx->xfer_func;
> > > +
> > > +	memset(f->fmt.pix_mp.plane_fmt[0].reserved, 0,
> > > +	       sizeof(f->fmt.pix_mp.plane_fmt[0].reserved));
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
> > > +				struct v4l2_format *f)
> > > +{
> > > +	return vidioc_g_fmt(file2ctx(file), f);
> > > +}
> > > +
> > > +static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
> > > +				struct v4l2_format *f)
> > > +{
> > > +	return vidioc_g_fmt(file2ctx(file), f);
> > > +}
> >=20
> > My first impression is that these two wrappers are not useful, you can=
=20
> > just fix
> > vidioc_g_fmt signature and use this twice in the op.
>=20
> ack
>=20
> > > +
> > > +static int vidioc_try_fmt(struct bcm2835_codec_ctx *ctx, struct=20
> > > v4l2_format *f,
> > > +			  struct bcm2835_codec_fmt *fmt)
> > > +{
> > > +	unsigned int sizeimage, min_bytesperline;
> > > +
> > > +	/*
> > > +	 * The V4L2 specification requires the driver to correct the format
> > > +	 * struct if any of the dimensions is unsupported
> > > +	 */
> > > +	if (f->fmt.pix_mp.width > ctx->dev->max_w)
> > > +		f->fmt.pix_mp.width =3D ctx->dev->max_w;
> > > +	if (f->fmt.pix_mp.height > ctx->dev->max_h)
> > > +		f->fmt.pix_mp.height =3D ctx->dev->max_h;
> > > +
> > > +	if (!(fmt->flags & V4L2_FMT_FLAG_COMPRESSED)) {
> > > +		/* Only clip min w/h on capture. Treat 0x0 as unknown. */
> > > +		if (f->fmt.pix_mp.width < MIN_W)
> > > +			f->fmt.pix_mp.width =3D MIN_W;
> > > +		if (f->fmt.pix_mp.height < MIN_H)
> > > +			f->fmt.pix_mp.height =3D MIN_H;
> > > +
> > > +		/*
> > > +		 * For decoders and image encoders the buffer must have
> > > +		 * a vertical alignment of 16 lines.
> > > +		 * The selection will reflect any cropping rectangle when only
> > > +		 * some of the pixels are active.
> > > +		 */
> > > +		if (ctx->dev->role =3D=3D DECODE || ctx->dev->role =3D=3D ENCODE_I=
MAGE)
> > > +			f->fmt.pix_mp.height =3D ALIGN(f->fmt.pix_mp.height, 16);
> > > +	}
> > > +	f->fmt.pix_mp.num_planes =3D 1;
> > > +	min_bytesperline =3D get_bytesperline(f->fmt.pix_mp.width,
> > > +					    f->fmt.pix_mp.height,
> > > +					    fmt, ctx->dev->role);
> > > +	if (f->fmt.pix_mp.plane_fmt[0].bytesperline < min_bytesperline)
> > > +		f->fmt.pix_mp.plane_fmt[0].bytesperline =3D min_bytesperline;
> > > +	f->fmt.pix_mp.plane_fmt[0].bytesperline =3D
> > > +		ALIGN(f->fmt.pix_mp.plane_fmt[0].bytesperline,
> > > +		      fmt->bytesperline_align[ctx->dev->role]);
> > > +
> > > +	sizeimage =3D get_sizeimage(f->fmt.pix_mp.plane_fmt[0].bytesperline=
,
> > > +				  f->fmt.pix_mp.width, f->fmt.pix_mp.height,
> > > +				  fmt);
> > > +	/*
> > > +	 * Drivers must set sizeimage for uncompressed formats
> > > +	 * Compressed formats allow the client to request an alternate
> > > +	 * size for the buffer.
> > > +	 */
> > > +	if (!(fmt->flags & V4L2_FMT_FLAG_COMPRESSED) ||
> > > +	    f->fmt.pix_mp.plane_fmt[0].sizeimage < sizeimage)
> > > +		f->fmt.pix_mp.plane_fmt[0].sizeimage =3D sizeimage;
> >=20
> > nit: You can offer this to all formats really, no need to make it=20
> > special. This
> > can be handy if you want to accommodate another driver requirement. It=
=20
> > also
> > makes the code simpler.
>=20
> ack
>=20
> > > +
> > > +	memset(f->fmt.pix_mp.plane_fmt[0].reserved, 0,
> > > +	       sizeof(f->fmt.pix_mp.plane_fmt[0].reserved));
> >=20
> > You can drop this, the ioctl layer already clears it with:
> >=20
> >                 memset_after(p, 0, fmt.pix_mp.xfer_func);
> >                 for (i =3D 0; i < p->fmt.pix_mp.num_planes; i++)
> >                         memset_after(&p->fmt.pix_mp.plane_fmt[i],
> >                                      0, bytesperline);
>=20
> ack
>=20
> > > +
> > > +	if (ctx->dev->role =3D=3D DECODE || ctx->dev->role =3D=3D DEINTERLA=
CE) {
> > > +		switch (f->fmt.pix_mp.field) {
> > > +		/*
> > > +		 * All of this is pretty much guesswork as we'll set the
> > > +		 * interlace format correctly come format changed, and signal
> > > +		 * it appropriately on each buffer.
> > > +		 */
> > > +		default:
> > > +		case V4L2_FIELD_NONE:
> > > +		case V4L2_FIELD_ANY:
> > > +			f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> > > +			break;
> > > +		case V4L2_FIELD_INTERLACED:
> > > +			f->fmt.pix_mp.field =3D V4L2_FIELD_INTERLACED;
> > > +			break;
> > > +		case V4L2_FIELD_TOP:
> > > +		case V4L2_FIELD_BOTTOM:
> > > +		case V4L2_FIELD_INTERLACED_TB:
> > > +			f->fmt.pix_mp.field =3D V4L2_FIELD_INTERLACED_TB;
> > > +			break;
> > > +		case V4L2_FIELD_INTERLACED_BT:
> > > +			f->fmt.pix_mp.field =3D V4L2_FIELD_INTERLACED_BT;
> > > +			break;
> > > +		}
> > > +	} else {
> > > +		f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
> > > +				  struct v4l2_format *f)
> > > +{
> > > +	struct bcm2835_codec_fmt *fmt;
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +
> > > +	fmt =3D find_format(f, ctx->dev, true);
> > > +	if (!fmt) {
> > > +		f->fmt.pix_mp.pixelformat =3D get_default_format(ctx->dev,
> > > +							       true)->fourcc;
> > > +		fmt =3D find_format(f, ctx->dev, true);
> > > +	}
> > > +
> > > +	return vidioc_try_fmt(ctx, f, fmt);
> > > +}
> > > +
> > > +static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
> > > +				  struct v4l2_format *f)
> > > +{
> > > +	struct bcm2835_codec_fmt *fmt;
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +
> > > +	fmt =3D find_format(f, ctx->dev, false);
> > > +	if (!fmt) {
> > > +		f->fmt.pix_mp.pixelformat =3D get_default_format(ctx->dev,
> > > +							       false)->fourcc;
> > > +		fmt =3D find_format(f, ctx->dev, false);
> > > +	}
> > > +
> > > +	if (!f->fmt.pix_mp.colorspace)
> > > +		f->fmt.pix_mp.colorspace =3D ctx->colorspace;
> > > +
> > > +	return vidioc_try_fmt(ctx, f, fmt);
> > > +}
> > > +
> > > +static int vidioc_s_fmt(struct bcm2835_codec_ctx *ctx, struct=20
> > > v4l2_format *f,
> > > +			unsigned int requested_height)
> > > +{
> > > +	struct bcm2835_codec_q_data *q_data;
> > > +	struct vb2_queue *vq;
> > > +	struct vchiq_mmal_port *port;
> > > +	bool update_capture_port =3D false;
> > > +	bool reenable_port =3D false;
> > > +	int ret;
> > > +
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev,	"Setting format for type %d=
,=20
> > > wxh: %dx%d, fmt: %08x, size %u\n",
> > > +		 f->type, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
> > > +		 f->fmt.pix_mp.pixelformat,
> > > +		 f->fmt.pix_mp.plane_fmt[0].sizeimage);
> > > +
> > > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > > +	if (!vq)
> > > +		return -EINVAL;
> > > +
> > > +	q_data =3D get_q_data(ctx, f->type);
> > > +	if (!q_data)
> > > +		return -EINVAL;
> > > +
> > > +	if (vb2_is_busy(vq)) {
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "%s queue busy\n", __func__);
> > > +		return -EBUSY;
> > > +	}
> > > +
> > > +	q_data->fmt =3D find_format(f, ctx->dev,
> > > +				  f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > > +	q_data->crop_width =3D f->fmt.pix_mp.width;
> > > +	q_data->height =3D f->fmt.pix_mp.height;
> > > +	if (!q_data->selection_set ||
> > > +	    (q_data->fmt->flags & V4L2_FMT_FLAG_COMPRESSED))
> > > +		q_data->crop_height =3D requested_height;
> > > +
> > > +	/*
> > > +	 * Copying the behaviour of vicodec which retains a single set of
> > > +	 * colorspace parameters for both input and output.
> > > +	 */
> > > +	ctx->colorspace =3D f->fmt.pix_mp.colorspace;
> > > +	ctx->xfer_func =3D f->fmt.pix_mp.xfer_func;
> > > +	ctx->ycbcr_enc =3D f->fmt.pix_mp.ycbcr_enc;
> > > +	ctx->quant =3D f->fmt.pix_mp.quantization;
> > > +
> > > +	q_data->field =3D f->fmt.pix_mp.field;
> > > +
> > > +	/* All parameters should have been set correctly by try_fmt */
> > > +	q_data->bytesperline =3D f->fmt.pix_mp.plane_fmt[0].bytesperline;
> > > +	q_data->sizeimage =3D f->fmt.pix_mp.plane_fmt[0].sizeimage;
> > > +
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev,	"Calculated bpl as %u, size=
=20
> > > %u\n",
> > > +		 q_data->bytesperline, q_data->sizeimage);
> > > +
> > > +	if ((ctx->dev->role =3D=3D DECODE || ctx->dev->role =3D=3D ENCODE_I=
MAGE) &&
> > > +	    q_data->fmt->flags & V4L2_FMT_FLAG_COMPRESSED &&
> > > +	    q_data->crop_width && q_data->height) {
> > > +		/*
> > > +		 * On the decoder or image encoder, if provided with
> > > +		 * a resolution on the input side, then replicate that
> > > +		 * to the output side.
> > > +		 * GStreamer appears not to support V4L2_EVENT_SOURCE_CHANGE,
> > > +		 * nor set up a resolution on the output side, therefore
> > > +		 * we can't decode anything at a resolution other than the
> > > +		 * default one.
> > > +		 */
> >=20
> > GStreamer fully supports this now. As I explain earlier, it actually=
=20
> > let the
> > driver report the resolution before allocating the capture buffers now.=
=20
> > For
> > backward compatibility with older GStreamer (and FFMPEG btw), which=20
> > both had
> > implementation before SRC_CH spec even existed, you will want to guess=
=20
> > the
> > capture format from the userspace provided display (or coded)=20
> > resolution on the
> > output queue. In fact, as you have 32 or 64 pixel alignment, it will=
=20
> > work in a
> > very wide variety of cases. Please reword the rationale for this=20
> > (optional)
> > code.
>=20
> You wouldn't know by chance if FFPMEG supports this too? I guess we=20
> can't remove this part?

FFMPEG also supports this, but it will always try to allocate something bef=
ore
the headers are parsed. Both ways are valid. Long term we will have a compl=
iance
tool specialized for codec so we can test both ways easily. But for now, we=
 have
to install bunch of different software, and we totally understand that time=
 is
limited and all this testing are for now just nice to have.

>=20
> > > +		struct bcm2835_codec_q_data *q_data_dst =3D
> > > +						&ctx->q_data[V4L2_M2M_DST];
> > > +
> > > +		q_data_dst->crop_width =3D q_data->crop_width;
> > > +		q_data_dst->crop_height =3D q_data->crop_height;
> > > +		q_data_dst->height =3D ALIGN(q_data->crop_height, 16);
> > > +
> > > +		q_data_dst->bytesperline =3D
> > > +			get_bytesperline(f->fmt.pix_mp.width,
> > > +					 f->fmt.pix_mp.height,
> > > +					 q_data_dst->fmt, ctx->dev->role);
> > > +		q_data_dst->sizeimage =3D get_sizeimage(q_data_dst->bytesperline,
> > > +						      q_data_dst->crop_width,
> > > +						      q_data_dst->height,
> > > +						      q_data_dst->fmt);
> > > +		update_capture_port =3D true;
> > > +	}
> > > +
> > > +	/* If we have a component then setup the port as well */
> > > +	port =3D get_port_data(ctx, vq->type);
> > > +	if (!port)
> > > +		return 0;
> > > +
> > > +	if (port->enabled) {
> > > +		unsigned int num_buffers;
> > > +
> > > +		/*
> > > +		 * This should only ever happen with DECODE and the MMAL output
> > > +		 * port that has been enabled for resolution changed events.
> > > +		 * In this case no buffers have been allocated or sent to the
> > > +		 * component, so warn on that.
> > > +		 */
> > > +		WARN_ON(ctx->dev->role !=3D DECODE ||
> > > +			f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
> > > +			atomic_read(&port->buffers_with_vpu));
> > > +
> > > +		/*
> > > +		 * Disable will reread the port format, so retain buffer count.
> > > +		 */
> > > +		num_buffers =3D port->current_buffer.num;
> > > +
> > > +		ret =3D vchiq_mmal_port_disable(ctx->dev->instance, port);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Error disabling port update=
=20
> > > buffer count, ret %d\n",
> > > +				 __func__, ret);
> > > +
> > > +		port->current_buffer.num =3D num_buffers;
> > > +
> > > +		reenable_port =3D true;
> > > +	}
> > > +
> > > +	setup_mmal_port_format(ctx, q_data, port);
> > > +	ret =3D vchiq_mmal_port_set_format(ctx->dev->instance, port);
> > > +	if (ret) {
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed=20
> > > vchiq_mmal_port_set_format on port, ret %d\n",
> > > +			 __func__, ret);
> > > +		ret =3D -EINVAL;
> > > +	}
> > > +
> > > +	if (q_data->sizeimage < port->minimum_buffer.size) {
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "%s: Current buffer size of %u < min=
=20
> > > buf size %u - driver mismatch to MMAL\n",
> > > +			 __func__, q_data->sizeimage,
> > > +			 port->minimum_buffer.size);
> > > +	}
> > > +
> > > +	if (reenable_port) {
> > > +		ret =3D vchiq_mmal_port_enable(ctx->dev->instance,
> > > +					     port,
> > > +					     op_buffer_cb);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed enabling o/p port, ret=
=20
> > > %d\n",
> > > +				 __func__, ret);
> > > +	}
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev,	"Set format for type %d,=
=20
> > > wxh: %dx%d, fmt: %08x, size %u\n",
> > > +		 f->type, q_data->crop_width, q_data->height,
> > > +		 q_data->fmt->fourcc, q_data->sizeimage);
> > > +
> > > +	if (update_capture_port) {
> > > +		struct vchiq_mmal_port *port_dst =3D &ctx->component->output[0];
> > > +		struct bcm2835_codec_q_data *q_data_dst =3D
> > > +						&ctx->q_data[V4L2_M2M_DST];
> > > +
> > > +		setup_mmal_port_format(ctx, q_data_dst, port_dst);
> > > +		ret =3D vchiq_mmal_port_set_format(ctx->dev->instance, port_dst);
> > > +		if (ret) {
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed=20
> > > vchiq_mmal_port_set_format on output port, ret %d\n",
> > > +				 __func__, ret);
> > > +			ret =3D -EINVAL;
> > > +		}
> > > +	}
> > > +	return ret;
> > > +}
> >=20
> > nit: The mix of encoder, decoder and 1:1 filters in the same function=
=20
> > introduce
> > a bit  of complexity. It would help to have specialized implementation=
=20
> > per role,
> > and make turn that into an op table in the driver context.
>=20
> hmm, I don't know, a lot of the code is common, vidioc_s_fmt() doesn't=
=20
> seem too complex?
>=20
> > > +
> > > +static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
> > > +				struct v4l2_format *f)
> > > +{
> > > +	unsigned int height =3D f->fmt.pix_mp.height;
> > > +	int ret;
> > > +
> > > +	ret =3D vidioc_try_fmt_vid_cap(file, priv, f);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return vidioc_s_fmt(file2ctx(file), f, height);
> > > +}
> > > +
> > > +static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
> > > +				struct v4l2_format *f)
> > > +{
> > > +	unsigned int height =3D f->fmt.pix_mp.height;
> > > +	int ret;
> > > +
> > > +	ret =3D vidioc_try_fmt_vid_out(file, priv, f);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret =3D vidioc_s_fmt(file2ctx(file), f, height);
> > > +	return ret;
> > > +}
> > > +
> > > +static int vidioc_g_selection(struct file *file, void *priv,
> > > +			      struct v4l2_selection *s)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +	struct bcm2835_codec_q_data *q_data;
> > > +
> > > +	/*
> > > +	 * The selection API takes V4L2_BUF_TYPE_VIDEO_CAPTURE and
> > > +	 * V4L2_BUF_TYPE_VIDEO_OUTPUT, even if the device implements the=
=20
> > > MPLANE
> > > +	 * API. The V4L2 core will have converted the MPLANE variants to
> > > +	 * non-MPLANE.
> > > +	 * Open code this instead of using get_q_data in this case.
> > > +	 */
> > > +	switch (s->type) {
> > > +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > > +		/* CAPTURE on encoder is not valid. */
> > > +		if (ctx->dev->role =3D=3D ENCODE || ctx->dev->role =3D=3D ENCODE_I=
MAGE)
> > > +			return -EINVAL;
> > > +		q_data =3D &ctx->q_data[V4L2_M2M_DST];
> > > +		break;
> > > +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> > > +		/* OUTPUT on deoder is not valid. */
> > > +		if (ctx->dev->role =3D=3D DECODE)
> > > +			return -EINVAL;
> > > +		q_data =3D &ctx->q_data[V4L2_M2M_SRC];
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	switch (ctx->dev->role) {
> > > +	case DECODE:
> > > +		switch (s->target) {
> > > +		case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> > > +		case V4L2_SEL_TGT_COMPOSE:
> > > +			s->r.left =3D 0;
> > > +			s->r.top =3D 0;
> > > +			s->r.width =3D q_data->crop_width;
> > > +			s->r.height =3D q_data->crop_height;
> > > +			break;
> > > +		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > > +			s->r.left =3D 0;
> > > +			s->r.top =3D 0;
> > > +			s->r.width =3D q_data->crop_width;
> > > +			s->r.height =3D q_data->crop_height;
> > > +			break;
> > > +		case V4L2_SEL_TGT_CROP_BOUNDS:
> > > +		case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +			s->r.left =3D 0;
> > > +			s->r.top =3D 0;
> > > +			s->r.width =3D (q_data->bytesperline << 3) /
> > > +						q_data->fmt->depth;
> > > +			s->r.height =3D q_data->height;
> > > +			break;
> > > +		default:
> > > +			return -EINVAL;
> > > +		}
> > > +		break;
> > > +	case ENCODE:
> > > +	case ENCODE_IMAGE:
> > > +		switch (s->target) {
> > > +		case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +		case V4L2_SEL_TGT_CROP_BOUNDS:
> > > +			s->r.top =3D 0;
> > > +			s->r.left =3D 0;
> > > +			s->r.width =3D q_data->bytesperline;
> > > +			s->r.height =3D q_data->height;
> > > +			break;
> > > +		case V4L2_SEL_TGT_CROP:
> > > +			s->r.top =3D 0;
> > > +			s->r.left =3D 0;
> > > +			s->r.width =3D q_data->crop_width;
> > > +			s->r.height =3D q_data->crop_height;
> > > +			break;
> > > +		default:
> > > +			return -EINVAL;
> > > +		}
> > > +		break;
> > > +	case ISP:
> > > +	case DEINTERLACE:
> > > +		if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > > +			switch (s->target) {
> > > +			case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> > > +			case V4L2_SEL_TGT_COMPOSE:
> > > +				s->r.left =3D 0;
> > > +				s->r.top =3D 0;
> > > +				s->r.width =3D q_data->crop_width;
> > > +				s->r.height =3D q_data->crop_height;
> > > +				break;
> > > +			case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > > +				s->r.left =3D 0;
> > > +				s->r.top =3D 0;
> > > +				s->r.width =3D q_data->crop_width;
> > > +				s->r.height =3D q_data->crop_height;
> > > +				break;
> > > +			default:
> > > +				return -EINVAL;
> > > +			}
> > > +		} else {
> > > +			/* must be V4L2_BUF_TYPE_VIDEO_OUTPUT */
> > > +			switch (s->target) {
> > > +			case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +			case V4L2_SEL_TGT_CROP_BOUNDS:
> > > +				s->r.top =3D 0;
> > > +				s->r.left =3D 0;
> > > +				s->r.width =3D q_data->bytesperline;
> > > +				s->r.height =3D q_data->height;
> > > +				break;
> > > +			case V4L2_SEL_TGT_CROP:
> > > +				s->r.top =3D 0;
> > > +				s->r.left =3D 0;
> > > +				s->r.width =3D q_data->crop_width;
> > > +				s->r.height =3D q_data->crop_height;
> > > +				break;
> > > +			default:
> > > +				return -EINVAL;
> > > +			}
> > > +		}
> > > +		break;
> > > +	case NUM_ROLES:
> > > +		break;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_s_selection(struct file *file, void *priv,
> > > +			      struct v4l2_selection *s)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +	struct bcm2835_codec_q_data *q_data =3D NULL;
> > > +	struct vchiq_mmal_port *port =3D NULL;
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * The selection API takes V4L2_BUF_TYPE_VIDEO_CAPTURE and
> > > +	 * V4L2_BUF_TYPE_VIDEO_OUTPUT, even if the device implements the=
=20
> > > MPLANE
> > > +	 * API. The V4L2 core will have converted the MPLANE variants to
> > > +	 * non-MPLANE.
> > > +	 *
> > > +	 * Open code this instead of using get_q_data in this case.
> > > +	 */
> > > +	switch (s->type) {
> > > +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > > +		/* CAPTURE on encoder is not valid. */
> > > +		if (ctx->dev->role =3D=3D ENCODE || ctx->dev->role =3D=3D ENCODE_I=
MAGE)
> > > +			return -EINVAL;
> > > +		q_data =3D &ctx->q_data[V4L2_M2M_DST];
> > > +		if (ctx->component)
> > > +			port =3D &ctx->component->output[0];
> > > +		break;
> > > +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> > > +		/* OUTPUT on deoder is not valid. */
> > > +		if (ctx->dev->role =3D=3D DECODE)
> > > +			return -EINVAL;
> > > +		q_data =3D &ctx->q_data[V4L2_M2M_SRC];
> > > +		if (ctx->component)
> > > +			port =3D &ctx->component->input[0];
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: ctx %p, type %d, q_dat=
a=20
> > > %p, target %d, rect x/y %d/%d, w/h %ux%u\n",
> > > +		 __func__, ctx, s->type, q_data, s->target, s->r.left, s->r.top,
> > > +		 s->r.width, s->r.height);
> > > +
> > > +	switch (ctx->dev->role) {
> > > +	case DECODE:
> > > +		switch (s->target) {
> > > +		case V4L2_SEL_TGT_COMPOSE:
> > > +			/* Accept cropped image */
> > > +			s->r.left =3D 0;
> > > +			s->r.top =3D 0;
> > > +			s->r.width =3D min(s->r.width, q_data->crop_width);
> > > +			s->r.height =3D min(s->r.height, q_data->height);
> > > +			q_data->crop_width =3D s->r.width;
> > > +			q_data->crop_height =3D s->r.height;
> > > +			q_data->selection_set =3D true;
> > > +			break;
> > > +		default:
> > > +			return -EINVAL;
> > > +		}
> > > +		break;
> > > +	case ENCODE:
> > > +	case ENCODE_IMAGE:
> > > +		switch (s->target) {
> > > +		case V4L2_SEL_TGT_CROP:
> > > +			/* Only support crop from (0,0) */
> > > +			s->r.top =3D 0;
> > > +			s->r.left =3D 0;
> > > +			s->r.width =3D min(s->r.width, q_data->crop_width);
> > > +			s->r.height =3D min(s->r.height, q_data->height);
> > > +			q_data->crop_width =3D s->r.width;
> > > +			q_data->crop_height =3D s->r.height;
> > > +			q_data->selection_set =3D true;
> > > +			break;
> > > +		default:
> > > +			return -EINVAL;
> > > +		}
> > > +		break;
> > > +	case ISP:
> > > +	case DEINTERLACE:
> > > +		if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > > +			switch (s->target) {
> > > +			case V4L2_SEL_TGT_COMPOSE:
> > > +				/* Accept cropped image */
> > > +				s->r.left =3D 0;
> > > +				s->r.top =3D 0;
> > > +				s->r.width =3D min(s->r.width, q_data->crop_width);
> > > +				s->r.height =3D min(s->r.height, q_data->height);
> > > +				q_data->crop_width =3D s->r.width;
> > > +				q_data->crop_height =3D s->r.height;
> > > +				q_data->selection_set =3D true;
> > > +				break;
> > > +			default:
> > > +				return -EINVAL;
> > > +			}
> > > +			break;
> > > +		} else {
> > > +			/* must be V4L2_BUF_TYPE_VIDEO_OUTPUT */
> > > +			switch (s->target) {
> > > +			case V4L2_SEL_TGT_CROP:
> > > +				/* Only support crop from (0,0) */
> > > +				s->r.top =3D 0;
> > > +				s->r.left =3D 0;
> > > +				s->r.width =3D min(s->r.width, q_data->crop_width);
> > > +				s->r.height =3D min(s->r.height, q_data->height);
> > > +				q_data->crop_width =3D s->r.width;
> > > +				q_data->crop_height =3D s->r.height;
> > > +				q_data->selection_set =3D true;
> > > +				break;
> > > +			default:
> > > +				return -EINVAL;
> > > +			}
> > > +			break;
> > > +		}
> > > +	case NUM_ROLES:
> > > +		break;
> > > +	}
> > > +
> > > +	if (!port)
> > > +		return 0;
> > > +
> > > +	setup_mmal_port_format(ctx, q_data, port);
> > > +	ret =3D vchiq_mmal_port_set_format(ctx->dev->instance, port);
> > > +	if (ret) {
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed=20
> > > vchiq_mmal_port_set_format on port, ret %d\n",
> > > +			 __func__, ret);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_s_parm(struct file *file, void *priv,
> > > +			 struct v4l2_streamparm *parm)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +
> > > +	if (parm->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > > +		return -EINVAL;
> > > +
> > > +	if (!parm->parm.output.timeperframe.denominator ||
> > > +	    !parm->parm.output.timeperframe.numerator)
> > > +		return -EINVAL;
> > > +
> > > +	ctx->framerate_num =3D
> > > +			parm->parm.output.timeperframe.denominator;
> > > +	ctx->framerate_denom =3D
> > > +			parm->parm.output.timeperframe.numerator;
> > > +
> > > +	parm->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_g_parm(struct file *file, void *priv,
> > > +			 struct v4l2_streamparm *parm)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +
> > > +	if (parm->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > > +		return -EINVAL;
> > > +
> > > +	parm->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
> > > +	parm->parm.output.timeperframe.denominator =3D
> > > +			ctx->framerate_num;
> > > +	parm->parm.output.timeperframe.numerator =3D
> > > +			ctx->framerate_denom;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_g_pixelaspect(struct file *file, void *fh, int=20
> > > type,
> > > +				struct v4l2_fract *f)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +
> > > +	/*
> > > +	 * The selection API takes V4L2_BUF_TYPE_VIDEO_CAPTURE and
> > > +	 * V4L2_BUF_TYPE_VIDEO_OUTPUT, even if the device implements the=
=20
> > > MPLANE
> > > +	 * API. The V4L2 core will have converted the MPLANE variants to
> > > +	 * non-MPLANE.
> > > +	 * Open code this instead of using get_q_data in this case.
> > > +	 */
> > > +	if (ctx->dev->role !=3D DECODE)
> > > +		return -ENOIOCTLCMD;
> > > +
> > > +	if (type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > > +		return -EINVAL;
> > > +
> > > +	*f =3D ctx->q_data[V4L2_M2M_DST].aspect_ratio;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_subscribe_evt(struct v4l2_fh *fh,
> > > +				const struct v4l2_event_subscription *sub)
> > > +{
> > > +	switch (sub->type) {
> > > +	case V4L2_EVENT_EOS:
> > > +		return v4l2_event_subscribe(fh, sub, 2, NULL);
> > > +	case V4L2_EVENT_SOURCE_CHANGE:
> > > +		return v4l2_src_change_event_subscribe(fh, sub);
> > > +	default:
> > > +		return v4l2_ctrl_subscribe_event(fh, sub);
> > > +	}
> > > +}
> > > +
> > > +static int bcm2835_codec_set_level_profile(struct bcm2835_codec_ctx=
=20
> > > *ctx,
> > > +					   struct v4l2_ctrl *ctrl)
> > > +{
> > > +	struct mmal_parameter_video_profile param;
> > > +	int param_size =3D sizeof(param);
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * Level and Profile are set via the same MMAL parameter.
> > > +	 * Retrieve the current settings and amend the one that has changed=
.
> > > +	 */
> > > +	ret =3D vchiq_mmal_port_parameter_get(ctx->dev->instance,
> > > +					    &ctx->component->output[0],
> > > +					    MMAL_PARAMETER_PROFILE,
> > > +					    &param,
> > > +					    &param_size);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> > > +		switch (ctrl->val) {
> > > +		case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
> > > +			param.profile =3D MMAL_VIDEO_PROFILE_H264_BASELINE;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
> > > +			param.profile =3D
> > > +				MMAL_VIDEO_PROFILE_H264_CONSTRAINED_BASELINE;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
> > > +			param.profile =3D MMAL_VIDEO_PROFILE_H264_MAIN;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
> > > +			param.profile =3D MMAL_VIDEO_PROFILE_H264_HIGH;
> > > +			break;
> > > +		default:
> > > +			/* Should never get here */
> > > +			break;
> > > +		}
> > > +		break;
> > > +
> > > +	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> > > +		switch (ctrl->val) {
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_1;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_1b;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_11;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_12;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_13;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_2;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_21;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_22;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_3;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_31;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_32;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_4;
> > > +			break;
> > > +		/*
> > > +		 * Note that the hardware spec is level 4.0. Levels above that
> > > +		 * are there for correctly encoding the headers and may not
> > > +		 * be able to keep up with real-time.
> > > +		 */
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_41;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_42;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_5;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
> > > +			param.level =3D MMAL_VIDEO_LEVEL_H264_51;
> > > +			break;
> > > +		default:
> > > +			/* Should never get here */
> > > +			break;
> > > +		}
> > > +	}
> > > +	ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +					    &ctx->component->output[0],
> > > +					    MMAL_PARAMETER_PROFILE,
> > > +					    &param,
> > > +					    param_size);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int bcm2835_codec_s_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D
> > > +		container_of(ctrl->handler, struct bcm2835_codec_ctx, hdl);
> > > +	int ret =3D 0;
> > > +
> > > +	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
> > > +		return 0;
> > > +
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_MPEG_VIDEO_BITRATE:
> > > +		ctx->bitrate =3D ctrl->val;
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						    &ctx->component->output[0],
> > > +						    MMAL_PARAMETER_VIDEO_BIT_RATE,
> > > +						    &ctrl->val,
> > > +						    sizeof(ctrl->val));
> > > +		break;
> > > +
> > > +	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE: {
> > > +		u32 bitrate_mode;
> > > +
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		switch (ctrl->val) {
> > > +		default:
> > > +		case V4L2_MPEG_VIDEO_BITRATE_MODE_VBR:
> > > +			bitrate_mode =3D MMAL_VIDEO_RATECONTROL_VARIABLE;
> > > +			break;
> > > +		case V4L2_MPEG_VIDEO_BITRATE_MODE_CBR:
> > > +			bitrate_mode =3D MMAL_VIDEO_RATECONTROL_CONSTANT;
> > > +			break;
> > > +		}
> > > +
> > > +		ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						    &ctx->component->output[0],
> > > +						    MMAL_PARAMETER_RATECONTROL,
> > > +						    &bitrate_mode,
> > > +						    sizeof(bitrate_mode));
> > > +		break;
> > > +	}
> > > +	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						    &ctx->component->output[0],
> > > +						    MMAL_PARAMETER_VIDEO_ENCODE_INLINE_HEADER,
> > > +						    &ctrl->val,
> > > +						    sizeof(ctrl->val));
> > > +		break;
> > > +
> > > +	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						    &ctx->component->output[0],
> > > +						    MMAL_PARAMETER_VIDEO_ENCODE_HEADERS_WITH_FRAME,
> > > +						    &ctrl->val,
> > > +						    sizeof(ctrl->val));
> > > +		break;
> > > +
> > > +	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
> > > +		/*
> > > +		 * Incorrect initial implementation meant that H264_I_PERIOD
> > > +		 * was implemented to control intra-I period. As the MMAL
> > > +		 * encoder never produces I-frames that aren't IDR frames, it
> > > +		 * should actually have been GOP_SIZE.
> > > +		 * Support both controls, but writing to H264_I_PERIOD will
> > > +		 * update GOP_SIZE.
> > > +		 */
> > > +		__v4l2_ctrl_s_ctrl(ctx->gop_size, ctrl->val);
> >=20
> > Drop this this unless you decide to keep backward compatibility in=20
> > general. It
> > may confuse users having one control change another, so perhaps keep=
=20
> > both stored
> > separately, and then use the smallest in practice ?
>=20
> I don't know if anyone does use H264_I_PERIOD for this, tbh; If noone=20
> objects, I think we could remove this, no?

Steve would have an opinion on this. I personally don't find I_PERIOD very
useful, its often not supported by HW and is pretty niche concept.

>=20
> > > +	fallthrough;
> > > +	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						    &ctx->component->output[0],
> > > +						    MMAL_PARAMETER_INTRAPERIOD,
> > > +						    &ctrl->val,
> > > +						    sizeof(ctrl->val));
> > > +		break;
> > > +
> > > +	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> > > +	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D bcm2835_codec_set_level_profile(ctx, ctrl);
> > > +		break;
> > > +
> > > +	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						    &ctx->component->output[0],
> > > +						    MMAL_PARAMETER_VIDEO_ENCODE_MIN_QUANT,
> > > +						    &ctrl->val,
> > > +						    sizeof(ctrl->val));
> > > +		break;
> > > +
> > > +	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						    &ctx->component->output[0],
> > > +						    MMAL_PARAMETER_VIDEO_ENCODE_MAX_QUANT,
> > > +						    &ctrl->val,
> > > +						    sizeof(ctrl->val));
> > > +		break;
> > > +
> > > +	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME: {
> > > +		u32 mmal_bool =3D 1;
> > > +
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						    &ctx->component->output[0],
> > > +						    MMAL_PARAMETER_VIDEO_REQUEST_I_FRAME,
> > > +						    &mmal_bool,
> > > +						    sizeof(mmal_bool));
> > > +		break;
> > > +	}
> > > +	case V4L2_CID_HFLIP:
> > > +	case V4L2_CID_VFLIP: {
> > > +		u32 u32_value;
> > > +
> > > +		if (ctrl->id =3D=3D V4L2_CID_HFLIP)
> > > +			ctx->hflip =3D ctrl->val;
> > > +		else
> > > +			ctx->vflip =3D ctrl->val;
> > > +
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		if (ctx->hflip && ctx->vflip)
> > > +			u32_value =3D MMAL_PARAM_MIRROR_BOTH;
> > > +		else if (ctx->hflip)
> > > +			u32_value =3D MMAL_PARAM_MIRROR_HORIZONTAL;
> > > +		else if (ctx->vflip)
> > > +			u32_value =3D MMAL_PARAM_MIRROR_VERTICAL;
> > > +		else
> > > +			u32_value =3D MMAL_PARAM_MIRROR_NONE;
> > > +
> > > +		ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						    &ctx->component->input[0],
> > > +						    MMAL_PARAMETER_MIRROR,
> > > +						    &u32_value,
> > > +						    sizeof(u32_value));
> > > +		break;
> > > +	}
> > > +	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
> > > +		ret =3D 0;
> > > +		break;
> > >=20
> >=20
> > Wouldn't it be simpleer to not implement it at all ?
>=20
> One of the squashed patches had a commit message about B_FRAMES needed=
=20
> due to ffmpeg needing this. I added some inline comment above where it's=
=20
> mentioned. Though I guess the best way would be to patch ffmpeg to=20
> handle that case?

That is typical thing we do downstream, but in mainline the right approach =
is to
tell ffmpeg devs that this control is optional.

>=20
> > > +
> > > +	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						    &ctx->component->output[0],
> > > +						    MMAL_PARAMETER_JPEG_Q_FACTOR,
> > > +						    &ctrl->val,
> > > +						    sizeof(ctrl->val));
> > > +		break;
> > > +
> > > +	default:
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "Invalid control %08x\n", ctrl->id);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (ret)
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "Failed setting ctrl %08x, ret %d\n"=
,
> > > +			 ctrl->id, ret);
> > > +	return ret ? -EINVAL : 0;
> > > +}
> > > +
> > > +static const struct v4l2_ctrl_ops bcm2835_codec_ctrl_ops =3D {
> > > +	.s_ctrl =3D bcm2835_codec_s_ctrl,
> > > +};
> > > +
> > > +static int vidioc_try_decoder_cmd(struct file *file, void *priv,
> > > +				  struct v4l2_decoder_cmd *cmd)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +
> > > +	if (ctx->dev->role !=3D DECODE)
> > > +		return -EINVAL;
> > > +
> > > +	switch (cmd->cmd) {
> > > +	case V4L2_DEC_CMD_STOP:
> > > +		if (cmd->flags & V4L2_DEC_CMD_STOP_TO_BLACK) {
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: DEC cmd->flags=3D%u stop to bl=
ack=20
> > > not supported",
> > > +				 __func__, cmd->flags);
> > > +			return -EINVAL;
> > > +		}
> > > +		break;
> > > +	case V4L2_DEC_CMD_START:
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_decoder_cmd(struct file *file, void *priv,
> > > +			      struct v4l2_decoder_cmd *cmd)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +	struct bcm2835_codec_q_data *q_data =3D &ctx->q_data[V4L2_M2M_SRC];
> > > +	struct vb2_queue *dst_vq;
> > > +	int ret;
> > > +
> > > +	v4l2_dbg(2, debug, &ctx->dev->v4l2_dev, "%s, cmd %u", __func__,
> > > +		 cmd->cmd);
> > > +	ret =3D vidioc_try_decoder_cmd(file, priv, cmd);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	switch (cmd->cmd) {
> > > +	case V4L2_DEC_CMD_STOP:
> > > +		if (q_data->eos_buffer_in_use)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "EOS buffers already in use\n");
> > > +		q_data->eos_buffer_in_use =3D true;
> > > +
> > > +		q_data->eos_buffer.mmal.buffer_size =3D 0;
> > > +		q_data->eos_buffer.mmal.length =3D 0;
> > > +		q_data->eos_buffer.mmal.mmal_flags =3D
> > > +						MMAL_BUFFER_HEADER_FLAG_EOS;
> > > +		q_data->eos_buffer.mmal.pts =3D 0;
> > > +		q_data->eos_buffer.mmal.dts =3D 0;
> > > +
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D vchiq_mmal_submit_buffer(ctx->dev->instance,
> > > +					       &ctx->component->input[0],
> > > +					       &q_data->eos_buffer.mmal);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev,
> > > +				 "%s: EOS buffer submit failed %d\n",
> > > +				 __func__, ret);
> > > +
> > > +		break;
> > > +
> > > +	case V4L2_DEC_CMD_START:
> > > +		dst_vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> > > +					 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > > +		vb2_clear_last_buffer_dequeued(dst_vq);
> > > +		break;
> > > +
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_try_encoder_cmd(struct file *file, void *priv,
> > > +				  struct v4l2_encoder_cmd *cmd)
> > > +{
> > > +	switch (cmd->cmd) {
> > > +	case V4L2_ENC_CMD_STOP:
> > > +		break;
> > > +
> > > +	case V4L2_ENC_CMD_START:
> > > +		/* Do we need to do anything here? */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_encoder_cmd(struct file *file, void *priv,
> > > +			      struct v4l2_encoder_cmd *cmd)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +	struct bcm2835_codec_q_data *q_data =3D &ctx->q_data[V4L2_M2M_SRC];
> > > +	int ret;
> > > +
> > > +	v4l2_dbg(2, debug, &ctx->dev->v4l2_dev, "%s, cmd %u", __func__,
> > > +		 cmd->cmd);
> > > +	ret =3D vidioc_try_encoder_cmd(file, priv, cmd);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	switch (cmd->cmd) {
> > > +	case V4L2_ENC_CMD_STOP:
> > > +		if (q_data->eos_buffer_in_use)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "EOS buffers already in use\n");
> > > +		q_data->eos_buffer_in_use =3D true;
> > > +
> > > +		q_data->eos_buffer.mmal.buffer_size =3D 0;
> > > +		q_data->eos_buffer.mmal.length =3D 0;
> > > +		q_data->eos_buffer.mmal.mmal_flags =3D
> > > +						MMAL_BUFFER_HEADER_FLAG_EOS;
> > > +		q_data->eos_buffer.mmal.pts =3D 0;
> > > +		q_data->eos_buffer.mmal.dts =3D 0;
> > > +
> > > +		if (!ctx->component)
> > > +			break;
> > > +
> > > +		ret =3D vchiq_mmal_submit_buffer(ctx->dev->instance,
> > > +					       &ctx->component->input[0],
> > > +					       &q_data->eos_buffer.mmal);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev,
> > > +				 "%s: EOS buffer submit failed %d\n",
> > > +				 __func__, ret);
> > > +
> > > +		break;
> > > +	case V4L2_ENC_CMD_START:
> > > +		/* Do we need to do anything here? */
> > > +		break;
> > >=20
> >=20
> > As the lower part is identical as the one for decoders, you may want to=
=20
> > clear
> > the last buffer dequeued flag to ?
>=20
> ack
>=20
> > > +
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int vidioc_enum_framesizes(struct file *file, void *fh,
> > > +				  struct v4l2_frmsizeenum *fsize)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +	struct bcm2835_codec_fmt *fmt;
> > > +
> > > +	fmt =3D find_format_pix_fmt(fsize->pixel_format, file2ctx(file)->de=
v,
> > > +				  true);
> > > +	if (!fmt)
> > > +		fmt =3D find_format_pix_fmt(fsize->pixel_format,
> > > +					  file2ctx(file)->dev,
> > > +					  false);
> > > +
> > > +	if (!fmt)
> > > +		return -EINVAL;
> > > +
> > > +	if (fsize->index)
> > > +		return -EINVAL;
> > > +
> > > +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > > +
> > > +	fsize->stepwise.min_width =3D MIN_W;
> > > +	fsize->stepwise.max_width =3D ctx->dev->max_w;
> > > +	fsize->stepwise.step_width =3D 2;
> > > +	fsize->stepwise.min_height =3D MIN_H;
> > > +	fsize->stepwise.max_height =3D ctx->dev->max_h;
> > > +	fsize->stepwise.step_height =3D 2;
> > >=20
> >=20
> > nit: you could use a define. I believe 2 is because you use 420/422=20
> > subsampling,
> > and don't have no 444 support ?
>=20
> will do, any suggested name for this?

Perhaps MIN_STEP ? to go with MIN_W and MIN_H.

>=20
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct v4l2_ioctl_ops bcm2835_codec_ioctl_ops =3D {
> > > +	.vidioc_querycap	=3D vidioc_querycap,
> > > +
> > > +	.vidioc_enum_fmt_vid_cap =3D vidioc_enum_fmt_vid_cap,
> > > +	.vidioc_g_fmt_vid_cap_mplane	=3D vidioc_g_fmt_vid_cap,
> > > +	.vidioc_try_fmt_vid_cap_mplane	=3D vidioc_try_fmt_vid_cap,
> > > +	.vidioc_s_fmt_vid_cap_mplane	=3D vidioc_s_fmt_vid_cap,
> > > +
> > > +	.vidioc_enum_fmt_vid_out =3D vidioc_enum_fmt_vid_out,
> > > +	.vidioc_g_fmt_vid_out_mplane	=3D vidioc_g_fmt_vid_out,
> > > +	.vidioc_try_fmt_vid_out_mplane	=3D vidioc_try_fmt_vid_out,
> > > +	.vidioc_s_fmt_vid_out_mplane	=3D vidioc_s_fmt_vid_out,
> > > +
> > > +	.vidioc_reqbufs		=3D v4l2_m2m_ioctl_reqbufs,
> > > +	.vidioc_querybuf	=3D v4l2_m2m_ioctl_querybuf,
> > > +	.vidioc_qbuf		=3D v4l2_m2m_ioctl_qbuf,
> > > +	.vidioc_dqbuf		=3D v4l2_m2m_ioctl_dqbuf,
> > > +	.vidioc_prepare_buf	=3D v4l2_m2m_ioctl_prepare_buf,
> > > +	.vidioc_create_bufs	=3D v4l2_m2m_ioctl_create_bufs,
> > > +	.vidioc_expbuf		=3D v4l2_m2m_ioctl_expbuf,
> > > +
> > > +	.vidioc_streamon	=3D v4l2_m2m_ioctl_streamon,
> > > +	.vidioc_streamoff	=3D v4l2_m2m_ioctl_streamoff,
> > > +
> > > +	.vidioc_g_selection	=3D vidioc_g_selection,
> > > +	.vidioc_s_selection	=3D vidioc_s_selection,
> > > +
> > > +	.vidioc_g_parm		=3D vidioc_g_parm,
> > > +	.vidioc_s_parm		=3D vidioc_s_parm,
> > > +
> > > +	.vidioc_g_pixelaspect	=3D vidioc_g_pixelaspect,
> > > +
> > > +	.vidioc_subscribe_event =3D vidioc_subscribe_evt,
> > > +	.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> > > +
> > > +	.vidioc_decoder_cmd =3D vidioc_decoder_cmd,
> > > +	.vidioc_try_decoder_cmd =3D vidioc_try_decoder_cmd,
> > > +	.vidioc_encoder_cmd =3D vidioc_encoder_cmd,
> > > +	.vidioc_try_encoder_cmd =3D vidioc_try_encoder_cmd,
> > > +	.vidioc_enum_framesizes =3D vidioc_enum_framesizes,
> > > +};
> > > +
> > > +static int bcm2835_codec_create_component(struct bcm2835_codec_ctx=
=20
> > > *ctx)
> > > +{
> > > +	struct bcm2835_codec_dev *dev =3D ctx->dev;
> > > +	unsigned int enable =3D 1;
> > > +	int ret;
> > > +
> > > +	ret =3D vchiq_mmal_component_init(dev->instance,=20
> > > components[dev->role],
> > > +					&ctx->component);
> > > +	if (ret < 0) {
> > > +		v4l2_err(&dev->v4l2_dev, "%s: failed to create component %s\n",
> > > +			 __func__, components[dev->role]);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	vchiq_mmal_port_parameter_set(dev->instance,=20
> > > &ctx->component->input[0],
> > > +				      MMAL_PARAMETER_ZERO_COPY, &enable,
> > > +				      sizeof(enable));
> > > +	vchiq_mmal_port_parameter_set(dev->instance,=20
> > > &ctx->component->output[0],
> > > +				      MMAL_PARAMETER_ZERO_COPY, &enable,
> > > +				      sizeof(enable));
> > > +
> > > +	if (dev->role =3D=3D DECODE) {
> > > +		/*
> > > +		 * Disable firmware option that ensures decoded timestamps
> > > +		 * always increase.
> > > +		 */
> > > +		enable =3D 0;
> > > +		vchiq_mmal_port_parameter_set(dev->instance,
> > > +					      &ctx->component->output[0],
> > > +					      MMAL_PARAMETER_VIDEO_VALIDATE_TIMESTAMPS,
> > > +					      &enable,
> > > +					      sizeof(enable));
> > > +		/*
> > > +		 * Enable firmware option to stop on colourspace and pixel
> > > +		 * aspect ratio changed
> > > +		 */
> > > +		enable =3D 1;
> > > +		vchiq_mmal_port_parameter_set(dev->instance,
> > > +					      &ctx->component->control,
> > > +					      MMAL_PARAMETER_VIDEO_STOP_ON_PAR_COLOUR_CHANGE,
> > > +					      &enable,
> > > +					      sizeof(enable));
> > > +	} else if (dev->role =3D=3D DEINTERLACE) {
> > > +		/* Select the default deinterlace algorithm. */
> > > +		int half_framerate =3D 0;
> > > +		int default_frame_interval =3D -1; /* don't interpolate */
> > > +		int frame_type =3D 5; /* 0=3Dprogressive, 3=3DTFF, 4=3DBFF, 5=3Dse=
e frame */
> > > +		int use_qpus =3D 0;
> > > +		enum mmal_parameter_imagefx effect =3D
> > > +			advanced_deinterlace && ctx->q_data[V4L2_M2M_SRC].crop_width <=3D=
=20
> > > 800 ?
> > > +			MMAL_PARAM_IMAGEFX_DEINTERLACE_ADV :
> > > +			MMAL_PARAM_IMAGEFX_DEINTERLACE_FAST;
> > > +		struct mmal_parameter_imagefx_parameters params =3D {
> > > +			.effect =3D effect,
> > > +			.num_effect_params =3D 4,
> > > +			.effect_parameter =3D { frame_type,
> > > +					      default_frame_interval,
> > > +					      half_framerate,
> > > +					      use_qpus },
> > > +		};
> > > +
> > > +		vchiq_mmal_port_parameter_set(dev->instance,
> > > +					      &ctx->component->output[0],
> > > +					      MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
> > > +					      &params,
> > > +					      sizeof(params));
> > > +
> > > +	} else if (dev->role =3D=3D ENCODE_IMAGE) {
> > > +		enable =3D 0;
> > > +		vchiq_mmal_port_parameter_set(dev->instance,
> > > +					      &ctx->component->control,
> > > +					      MMAL_PARAMETER_EXIF_DISABLE,
> > > +					      &enable,
> > > +					      sizeof(enable));
> > > +		enable =3D 1;
> > > +		vchiq_mmal_port_parameter_set(dev->instance,
> > > +					      &ctx->component->output[0],
> > > +						  MMAL_PARAMETER_JPEG_IJG_SCALING,
> > > +					      &enable,
> > > +					      sizeof(enable));
> > > +	}
> > > +
> > > +	setup_mmal_port_format(ctx, &ctx->q_data[V4L2_M2M_SRC],
> > > +			       &ctx->component->input[0]);
> > > +	ctx->component->input[0].cb_ctx =3D ctx;
> > > +
> > > +	setup_mmal_port_format(ctx, &ctx->q_data[V4L2_M2M_DST],
> > > +			       &ctx->component->output[0]);
> > > +	ctx->component->output[0].cb_ctx =3D ctx;
> > > +
> > > +	ret =3D vchiq_mmal_port_set_format(dev->instance,
> > > +					 &ctx->component->input[0]);
> > > +	if (ret < 0) {
> > > +		v4l2_dbg(1, debug, &dev->v4l2_dev,
> > > +			 "%s: vchiq_mmal_port_set_format ip port failed\n",
> > > +			 __func__);
> > > +		goto destroy_component;
> > > +	}
> > > +
> > > +	ret =3D vchiq_mmal_port_set_format(dev->instance,
> > > +					 &ctx->component->output[0]);
> > > +	if (ret < 0) {
> > > +		v4l2_dbg(1, debug, &dev->v4l2_dev,
> > > +			 "%s: vchiq_mmal_port_set_format op port failed\n",
> > > +			 __func__);
> > > +		goto destroy_component;
> > > +	}
> > > +
> > > +	if (dev->role =3D=3D ENCODE || dev->role =3D=3D ENCODE_IMAGE) {
> > > +		u32 param =3D 1;
> > > +
> > > +		if (ctx->q_data[V4L2_M2M_SRC].sizeimage <
> > > +			ctx->component->output[0].minimum_buffer.size)
> > > +			v4l2_err(&dev->v4l2_dev, "buffer size mismatch sizeimage %u < min=
=20
> > > size %u\n",
> > > +				 ctx->q_data[V4L2_M2M_SRC].sizeimage,
> > > +				 ctx->component->output[0].minimum_buffer.size);
> > > +
> > > +		if (dev->role =3D=3D ENCODE) {
> > > +			/* Enable SPS Timing header so framerate information is encoded
> > > +			 * in the H264 header.
> > > +			 */
> > > +			vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						      &ctx->component->output[0],
> > > +						      MMAL_PARAMETER_VIDEO_ENCODE_SPS_TIMING,
> > > +						      &param, sizeof(param));
> > > +
> > > +			/* Enable inserting headers into the first frame */
> > > +			vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						      &ctx->component->control,
> > > +						      MMAL_PARAMETER_VIDEO_ENCODE_HEADERS_WITH_FRAME,
> > > +						      &param, sizeof(param));
> > > +			/*
> > > +			 * Avoid fragmenting the buffers over multiple frames (unless
> > > +			 * the frame is bigger than the whole buffer)
> > > +			 */
> > > +			vchiq_mmal_port_parameter_set(ctx->dev->instance,
> > > +						      &ctx->component->control,
> > > +						      MMAL_PARAMETER_MINIMISE_FRAGMENTATION,
> > > +						      &param, sizeof(param));
> > > +		}
> > > +	} else {
> > > +		if (ctx->q_data[V4L2_M2M_DST].sizeimage <
> > > +			ctx->component->output[0].minimum_buffer.size)
> > > +			v4l2_err(&dev->v4l2_dev, "buffer size mismatch sizeimage %u < min=
=20
> > > size %u\n",
> > > +				 ctx->q_data[V4L2_M2M_DST].sizeimage,
> > > +				 ctx->component->output[0].minimum_buffer.size);
> > > +	}
> > > +
> > > +	/* Now we have a component we can set all the ctrls */
> > > +	ret =3D v4l2_ctrl_handler_setup(&ctx->hdl);
> > > +
> > > +	v4l2_dbg(2, debug, &dev->v4l2_dev, "%s: component created as %s\n",
> > > +		 __func__, components[dev->role]);
> > > +
> > > +	return 0;
> > > +
> > > +destroy_component:
> > > +	vchiq_mmal_component_finalise(ctx->dev->instance, ctx->component);
> > > +	ctx->component =3D NULL;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/*
> > > + * Queue operations
> > > + */
> > > +
> > > +static int bcm2835_codec_queue_setup(struct vb2_queue *vq,
> > > +				     unsigned int *nbuffers,
> > > +				     unsigned int *nplanes,
> > > +				     unsigned int sizes[],
> > > +				     struct device *alloc_devs[])
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D vb2_get_drv_priv(vq);
> > > +	struct bcm2835_codec_q_data *q_data;
> > > +	struct vchiq_mmal_port *port;
> > > +	unsigned int size;
> > > +
> > > +	q_data =3D get_q_data(ctx, vq->type);
> > > +	if (!q_data)
> > > +		return -EINVAL;
> > > +
> > > +	if (!ctx->component)
> > > +		if (bcm2835_codec_create_component(ctx))
> > > +			return -EINVAL;
> > > +
> > > +	port =3D get_port_data(ctx, vq->type);
> > > +
> > > +	size =3D q_data->sizeimage;
> > > +
> > > +	if (*nplanes)
> > > +		return sizes[0] < size ? -EINVAL : 0;
> > > +
> > > +	*nplanes =3D 1;
> > > +
> > > +	sizes[0] =3D size;
> > > +	port->current_buffer.size =3D size;
> > > +
> > > +	if (*nbuffers < port->minimum_buffer.num)
> > > +		*nbuffers =3D port->minimum_buffer.num;
> > > +	/* Add one buffer to take an EOS */
> > > +	port->current_buffer.num =3D *nbuffers + 1;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int bcm2835_codec_mmal_buf_cleanup(struct mmal_buffer=20
> > > *mmal_buf)
> > > +{
> > > +	mmal_vchi_buffer_cleanup(mmal_buf);
> > > +
> > > +	if (mmal_buf->dma_buf) {
> > > +		dma_buf_put(mmal_buf->dma_buf);
> > > +		mmal_buf->dma_buf =3D NULL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int bcm2835_codec_buf_init(struct vb2_buffer *vb)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > > +	struct vb2_v4l2_buffer *vb2 =3D to_vb2_v4l2_buffer(vb);
> > > +	struct v4l2_m2m_buffer *m2m =3D container_of(vb2, struct=20
> > > v4l2_m2m_buffer,
> > > +						   vb);
> > > +	struct m2m_mmal_buffer *buf =3D container_of(m2m, struct=20
> > > m2m_mmal_buffer,
> > > +						   m2m);
> > > +
> > > +	v4l2_dbg(2, debug, &ctx->dev->v4l2_dev, "%s: ctx:%p, vb %p\n",
> > > +		 __func__, ctx, vb);
> > > +	buf->mmal.buffer =3D vb2_plane_vaddr(&buf->m2m.vb.vb2_buf, 0);
> > > +	buf->mmal.buffer_size =3D vb2_plane_size(&buf->m2m.vb.vb2_buf, 0);
> > > +
> > > +	mmal_vchi_buffer_init(ctx->dev->instance, &buf->mmal);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int bcm2835_codec_buf_prepare(struct vb2_buffer *vb)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > > +	struct bcm2835_codec_q_data *q_data;
> > > +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > > +	struct v4l2_m2m_buffer *m2m =3D container_of(vbuf, struct=20
> > > v4l2_m2m_buffer,
> > > +						   vb);
> > > +	struct m2m_mmal_buffer *buf =3D container_of(m2m, struct=20
> > > m2m_mmal_buffer,
> > > +						   m2m);
> > > +	struct dma_buf *dma_buf;
> > > +	int ret;
> > > +
> > > +	v4l2_dbg(4, debug, &ctx->dev->v4l2_dev, "%s: type: %d ptr %p\n",
> > > +		 __func__, vb->vb2_queue->type, vb);
> > > +
> > > +	q_data =3D get_q_data(ctx, vb->vb2_queue->type);
> > > +	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> > > +		if (vbuf->field =3D=3D V4L2_FIELD_ANY)
> > > +			vbuf->field =3D V4L2_FIELD_NONE;
> > > +	}
> > > +
> > > +	if (vb2_plane_size(vb, 0) < q_data->sizeimage) {
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "%s data will not fit into plane (%l=
u=20
> > > < %lu)\n",
> > > +			 __func__, vb2_plane_size(vb, 0),
> > > +			 (long)q_data->sizeimage);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
> > > +		vb2_set_plane_payload(vb, 0, q_data->sizeimage);
> > > +
> > > +	switch (vb->memory) {
> > > +	case VB2_MEMORY_DMABUF:
> > > +		dma_buf =3D dma_buf_get(vb->planes[0].m.fd);
> > > +
> > > +		if (dma_buf !=3D buf->mmal.dma_buf) {
> > > +			/* dmabuf either hasn't already been mapped, or it has
> > > +			 * changed.
> > > +			 */
> > > +			if (buf->mmal.dma_buf) {
> > > +				v4l2_err(&ctx->dev->v4l2_dev,
> > > +					 "%s Buffer changed - why did the core not call cleanup?\n",
> > > +					 __func__);
> > > +				bcm2835_codec_mmal_buf_cleanup(&buf->mmal);
> > > +			}
> > > +
> > > +			buf->mmal.dma_buf =3D dma_buf;
> > > +		} else {
> > > +			/* We already have a reference count on the dmabuf, so
> > > +			 * release the one we acquired above.
> > > +			 */
> > > +			dma_buf_put(dma_buf);
> > > +		}
> > > +		ret =3D 0;
> > > +		break;
> > > +	case VB2_MEMORY_MMAP:
> > > +		/*
> > > +		 * We want to do this at init, but vb2_core_expbuf checks that
> > > +		 * the index < q->num_buffers, and q->num_buffers only gets
> > > +		 * updated once all the buffers are allocated.
> > > +		 */
> > > +		if (!buf->mmal.dma_buf) {
> > > +			buf->mmal.dma_buf =3D vb2_core_expbuf_dmabuf(vb->vb2_queue,
> > > +						     vb->vb2_queue->type,
> > > +						     vb, 0,
> > > +						     O_CLOEXEC);
> > > +			v4l2_dbg(3, debug, &ctx->dev->v4l2_dev,
> > > +				 "%s: exporting ptr %p to dmabuf %p\n",
> > > +				 __func__, vb, buf->mmal.dma_buf);
> > > +			if (IS_ERR(buf->mmal.dma_buf)) {
> > > +				ret =3D PTR_ERR(buf->mmal.dma_buf);
> > > +				v4l2_err(&ctx->dev->v4l2_dev,
> > > +					 "%s: Failed to expbuf idx %d, ret %d\n",
> > > +					 __func__, vb->index, ret);
> > > +			}
> > > +		} else {
> > > +			ret =3D 0;
> > > +		}
> > > +		break;
> > > +	default:
> > > +		ret =3D -EINVAL;
> > > +		break;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void bcm2835_codec_buf_queue(struct vb2_buffer *vb)
> > > +{
> > > +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > > +	struct bcm2835_codec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > > +
> > > +	v4l2_dbg(4, debug, &ctx->dev->v4l2_dev, "%s: type: %d ptr %p=20
> > > vbuf->flags %u, seq %u, bytesused %u\n",
> > > +		 __func__, vb->vb2_queue->type, vb, vbuf->flags, vbuf->sequence,
> > > +		 vb->planes[0].bytesused);
> > > +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> > > +}
> > > +
> > > +static void bcm2835_codec_buffer_cleanup(struct vb2_buffer *vb)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > > +	struct vb2_v4l2_buffer *vb2 =3D to_vb2_v4l2_buffer(vb);
> > > +	struct v4l2_m2m_buffer *m2m =3D container_of(vb2, struct=20
> > > v4l2_m2m_buffer,
> > > +						   vb);
> > > +	struct m2m_mmal_buffer *buf =3D container_of(m2m, struct=20
> > > m2m_mmal_buffer,
> > > +						   m2m);
> > > +
> > > +	v4l2_dbg(2, debug, &ctx->dev->v4l2_dev, "%s: ctx:%p, vb %p\n",
> > > +		 __func__, ctx, vb);
> > > +
> > > +	bcm2835_codec_mmal_buf_cleanup(&buf->mmal);
> > > +}
> > > +
> > > +static void bcm2835_codec_flush_buffers(struct bcm2835_codec_ctx=20
> > > *ctx,
> > > +					struct vchiq_mmal_port *port)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (atomic_read(&port->buffers_with_vpu)) {
> > > +		v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: Waiting for buffers t=
o=20
> > > be returned - %d outstanding\n",
> > > +			 __func__, atomic_read(&port->buffers_with_vpu));
> > > +		ret =3D wait_for_completion_timeout(&ctx->frame_cmplt,
> > > +						  COMPLETE_TIMEOUT);
> > > +		if (ret <=3D 0) {
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Timeout waiting for buffers to=
=20
> > > be returned - %d outstanding\n",
> > > +				 __func__,
> > > +				 atomic_read(&port->buffers_with_vpu));
> > > +		}
> > > +	}
> > > +}
> > > +static int bcm2835_codec_start_streaming(struct vb2_queue *q,
> > > +					 unsigned int count)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D vb2_get_drv_priv(q);
> > > +	struct bcm2835_codec_dev *dev =3D ctx->dev;
> > > +	struct bcm2835_codec_q_data *q_data =3D get_q_data(ctx, q->type);
> > > +	struct vchiq_mmal_port *port =3D get_port_data(ctx, q->type);
> > > +	int ret =3D 0;
> > > +
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: type: %d count %d\n",
> > > +		 __func__, q->type, count);
> > > +	q_data->sequence =3D 0;
> > > +
> > > +	if (!ctx->component_enabled) {
> > > +		ret =3D vchiq_mmal_component_enable(dev->instance,
> > > +						  ctx->component);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed enabling component, ret=
=20
> > > %d\n",
> > > +				 __func__, ret);
> > > +		ctx->component_enabled =3D true;
> > > +	}
> > > +
> > > +	if (port->enabled) {
> > > +		unsigned int num_buffers;
> > > +
> > > +		init_completion(&ctx->frame_cmplt);
> > > +
> > > +		/*
> > > +		 * This should only ever happen with DECODE and the MMAL output
> > > +		 * port that has been enabled for resolution changed events.
> > > +		 * In this case no buffers have been allocated or sent to the
> > > +		 * component, so warn on that.
> > > +		 */
> > > +		WARN_ON(ctx->dev->role !=3D DECODE);
> > > +		WARN_ON(q->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > > +		WARN_ON(atomic_read(&port->buffers_with_vpu));
> > > +
> > > +		/*
> > > +		 * Disable will reread the port format, so retain buffer count.
> > > +		 */
> > > +		num_buffers =3D port->current_buffer.num;
> > > +
> > > +		ret =3D vchiq_mmal_port_disable(dev->instance, port);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Error disabling port update=
=20
> > > buffer count, ret %d\n",
> > > +				 __func__, ret);
> > > +		bcm2835_codec_flush_buffers(ctx, port);
> > > +		port->current_buffer.num =3D num_buffers;
> > > +	}
> > > +
> > > +	if (count < port->minimum_buffer.num)
> > > +		count =3D port->minimum_buffer.num;
> > > +
> > > +	if (port->current_buffer.num < count + 1) {
> > > +		v4l2_dbg(2, debug, &ctx->dev->v4l2_dev, "%s: ctx:%p, buffer count=
=20
> > > changed %u to %u\n",
> > > +			 __func__, ctx, port->current_buffer.num, count + 1);
> > > +
> > > +		port->current_buffer.num =3D count + 1;
> > > +		ret =3D vchiq_mmal_port_set_format(dev->instance, port);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Error updating buffer count,=
=20
> > > ret %d\n",
> > > +				 __func__, ret);
> > > +	}
> > > +
> > > +	if (dev->role =3D=3D DECODE &&
> > > +	    q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
> > > +	    !ctx->component->output[0].enabled) {
> > > +		/*
> > > +		 * Decode needs to enable the MMAL output/V4L2 CAPTURE
> > > +		 * port at this point too so that we have everything
> > > +		 * set up for dynamic resolution changes.
> > > +		 */
> > > +		ret =3D vchiq_mmal_port_enable(dev->instance,
> > > +					     &ctx->component->output[0],
> > > +					     op_buffer_cb);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed enabling o/p port, ret=
=20
> > > %d\n",
> > > +				 __func__, ret);
> > > +	}
> > > +
> > > +	if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> > > +		/*
> > > +		 * Create the EOS buffer.
> > > +		 * We only need the MMAL part, and want to NOT attach a memory
> > > +		 * buffer to it as it should only take flags.
> > > +		 */
> > > +		memset(&q_data->eos_buffer, 0, sizeof(q_data->eos_buffer));
> > > +		mmal_vchi_buffer_init(dev->instance,
> > > +				      &q_data->eos_buffer.mmal);
> > > +		q_data->eos_buffer_in_use =3D false;
> > > +
> > > +		ret =3D vchiq_mmal_port_enable(dev->instance,
> > > +					     port,
> > > +					     ip_buffer_cb);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed enabling i/p port, ret=
=20
> > > %d\n",
> > > +				 __func__, ret);
> > > +	} else {
> > > +		if (!port->enabled) {
> > > +			ret =3D vchiq_mmal_port_enable(dev->instance,
> > > +						     port,
> > > +						     op_buffer_cb);
> > > +			if (ret)
> > > +				v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed enabling o/p port, ret=
=20
> > > %d\n",
> > > +					 __func__, ret);
> > > +		}
> > > +	}
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: Done, ret %d\n",
> > > +		 __func__, ret);
> > > +	return ret;
> > > +}
> > > +
> > > +static void bcm2835_codec_stop_streaming(struct vb2_queue *q)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D vb2_get_drv_priv(q);
> > > +	struct bcm2835_codec_dev *dev =3D ctx->dev;
> > > +	struct bcm2835_codec_q_data *q_data =3D get_q_data(ctx, q->type);
> > > +	struct vchiq_mmal_port *port =3D get_port_data(ctx, q->type);
> > > +	struct vb2_v4l2_buffer *vbuf;
> > > +	int ret;
> > > +
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: type: %d - return=20
> > > buffers\n",
> > > +		 __func__, q->type);
> > > +
> > > +	init_completion(&ctx->frame_cmplt);
> > > +
> > > +	/* Clear out all buffers held by m2m framework */
> > > +	for (;;) {
> > > +		if (V4L2_TYPE_IS_OUTPUT(q->type))
> > > +			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > > +		else
> > > +			vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > > +		if (!vbuf)
> > > +			break;
> > > +		v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: return buffer %p\n",
> > > +			 __func__, vbuf);
> > > +
> > > +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_QUEUED);
> > > +	}
> > > +
> > > +	/* Disable MMAL port - this will flush buffers back */
> > > +	ret =3D vchiq_mmal_port_disable(dev->instance, port);
> > > +	if (ret)
> > > +		v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed disabling %s port, ret=
=20
> > > %d\n",
> > > +			 __func__, V4L2_TYPE_IS_OUTPUT(q->type) ? "i/p" : "o/p",
> > > +			 ret);
> > > +
> > > +	bcm2835_codec_flush_buffers(ctx, port);
> > > +
> > > +	if (dev->role =3D=3D DECODE &&
> > > +	    q->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> > > +	    ctx->component->input[0].enabled) {
> > > +		/*
> > > +		 * For decode we need to keep the MMAL output port enabled for
> > > +		 * resolution changed events whenever the input is enabled.
> > > +		 */
> > > +		ret =3D vchiq_mmal_port_enable(dev->instance,
> > > +					     &ctx->component->output[0],
> > > +					     op_buffer_cb);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed enabling o/p port, ret=
=20
> > > %d\n",
> > > +				 __func__, ret);
> > > +	}
> > > +
> > > +	/* If both ports disabled, then disable the component */
> > > +	if (ctx->component_enabled &&
> > > +	    !ctx->component->input[0].enabled &&
> > > +	    !ctx->component->output[0].enabled) {
> > > +		ret =3D vchiq_mmal_component_disable(dev->instance,
> > > +						   ctx->component);
> > > +		if (ret)
> > > +			v4l2_err(&ctx->dev->v4l2_dev, "%s: Failed enabling component, ret=
=20
> > > %d\n",
> > > +				 __func__, ret);
> > > +		ctx->component_enabled =3D false;
> > > +	}
> > > +
> > > +	if (V4L2_TYPE_IS_OUTPUT(q->type))
> > > +		mmal_vchi_buffer_cleanup(&q_data->eos_buffer.mmal);
> > > +
> > > +	v4l2_dbg(1, debug, &ctx->dev->v4l2_dev, "%s: done\n", __func__);
> > > +}
> > > +
> > > +static const struct vb2_ops bcm2835_codec_qops =3D {
> > > +	.queue_setup	 =3D bcm2835_codec_queue_setup,
> > > +	.buf_init	 =3D bcm2835_codec_buf_init,
> > > +	.buf_prepare	 =3D bcm2835_codec_buf_prepare,
> > > +	.buf_queue	 =3D bcm2835_codec_buf_queue,
> > > +	.buf_cleanup	 =3D bcm2835_codec_buffer_cleanup,
> > > +	.start_streaming =3D bcm2835_codec_start_streaming,
> > > +	.stop_streaming  =3D bcm2835_codec_stop_streaming,
> > > +	.wait_prepare	 =3D vb2_ops_wait_prepare,
> > > +	.wait_finish	 =3D vb2_ops_wait_finish,
> > > +};
> > > +
> > > +static int queue_init(void *priv, struct vb2_queue *src_vq,
> > > +		      struct vb2_queue *dst_vq)
> > > +{
> > > +	struct bcm2835_codec_ctx *ctx =3D priv;
> > > +	int ret;
> > > +
> > > +	src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > > +	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > > +	src_vq->drv_priv =3D ctx;
> > > +	src_vq->buf_struct_size =3D sizeof(struct m2m_mmal_buffer);
> > > +	src_vq->ops =3D &bcm2835_codec_qops;
> > > +	src_vq->mem_ops =3D &vb2_dma_contig_memops;
> > > +	src_vq->dev =3D &ctx->dev->device->dev;
> > > +	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > +	src_vq->lock =3D &ctx->dev->dev_mutex;
> > > +
> > > +	ret =3D vb2_queue_init(src_vq);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > > +	dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > > +	dst_vq->drv_priv =3D ctx;
> > > +	dst_vq->buf_struct_size =3D sizeof(struct m2m_mmal_buffer);
> > > +	dst_vq->ops =3D &bcm2835_codec_qops;
> > > +	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> > > +	dst_vq->dev =3D &ctx->dev->device->dev;
> > > +	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > +	dst_vq->lock =3D &ctx->dev->dev_mutex;
> > > +
> > > +	return vb2_queue_init(dst_vq);
> > > +}
> > > +
> > > +static void dec_add_profile_ctrls(struct bcm2835_codec_dev *const=
=20
> > > dev,
> > > +				  struct v4l2_ctrl_handler *const hdl)
> > > +{
> > > +	struct v4l2_ctrl *ctrl;
> > > +	unsigned int i;
> > > +	const struct bcm2835_codec_fmt_list *const list =3D=20
> > > &dev->supported_fmts[0];
> > > +
> > > +	for (i =3D 0; i < list->num_entries; ++i) {
> > > +		switch (list->list[i].fourcc) {
> > > +		case V4L2_PIX_FMT_H264:
> > > +			ctrl =3D v4l2_ctrl_new_std_menu(hdl, &bcm2835_codec_ctrl_ops,
> > > +						      V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> > > +						      V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> > > +						      ~(BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2)),
> > > +						       V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
> > > +			ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > > +			ctrl =3D v4l2_ctrl_new_std_menu(hdl, &bcm2835_codec_ctrl_ops,
> > > +						      V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > > +						      V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +						      ~(BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> > > +							BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
> > > +						       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
> > > +			ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > > +			break;
> > > +		case V4L2_PIX_FMT_MPEG2:
> > > +			ctrl =3D v4l2_ctrl_new_std_menu(hdl, &bcm2835_codec_ctrl_ops,
> > > +						      V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL,
> > > +						      V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH,
> > > +						      ~(BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_LOW) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH_1440) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH)),
> > > +						      V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN);
> > > +			ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > > +			ctrl =3D v4l2_ctrl_new_std_menu(hdl, &bcm2835_codec_ctrl_ops,
> > > +						      V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE,
> > > +						      V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN,
> > > +						      ~(BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_SIMPLE) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN)),
> > > +						      V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN);
> > > +			ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > > +			break;
> > > +		case V4L2_PIX_FMT_MPEG4:
> > > +			ctrl =3D v4l2_ctrl_new_std_menu(hdl, &bcm2835_codec_ctrl_ops,
> > > +						      V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
> > > +						      V4L2_MPEG_VIDEO_MPEG4_LEVEL_5,
> > > +						      ~(BIT(V4L2_MPEG_VIDEO_MPEG4_LEVEL_0) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG4_LEVEL_1) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG4_LEVEL_2) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG4_LEVEL_3) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG4_LEVEL_3B) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG4_LEVEL_4) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG4_LEVEL_5)),
> > > +						      V4L2_MPEG_VIDEO_MPEG4_LEVEL_4);
> > > +			ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > > +			ctrl =3D v4l2_ctrl_new_std_menu(hdl, &bcm2835_codec_ctrl_ops,
> > > +						      V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
> > > +						      V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE,
> > > +						      ~(BIT(V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE) |
> > > +							BIT(V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE)),
> > > +						      V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE);
> > > +			ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > > +			break;
> > > +		/* No profiles defined by V4L2 */
> > > +		case V4L2_PIX_FMT_H263:
> > > +		case V4L2_PIX_FMT_JPEG:
> > > +		case V4L2_PIX_FMT_MJPEG:
> > > +		case V4L2_PIX_FMT_VC1_ANNEX_G:
> > > +		default:
> > > +			break;
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +/*
> > > + * File operations
> > > + */
> > > +static int bcm2835_codec_open(struct file *file)
> > > +{
> > > +	struct bcm2835_codec_dev *dev =3D video_drvdata(file);
> > > +	struct bcm2835_codec_ctx *ctx =3D NULL;
> > > +	struct v4l2_ctrl_handler *hdl;
> > > +	int rc =3D 0;
> > > +
> > > +	if (mutex_lock_interruptible(&dev->dev_mutex)) {
> > > +		v4l2_err(&dev->v4l2_dev, "Mutex fail\n");
> > > +		return -ERESTARTSYS;
> > > +	}
> > > +	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> > > +	if (!ctx) {
> > > +		rc =3D -ENOMEM;
> > > +		goto open_unlock;
> > > +	}
> > > +
> > > +	ctx->q_data[V4L2_M2M_SRC].fmt =3D get_default_format(dev, false);
> > > +	ctx->q_data[V4L2_M2M_DST].fmt =3D get_default_format(dev, true);
> > > +
> > > +	ctx->q_data[V4L2_M2M_SRC].crop_width =3D DEFAULT_WIDTH;
> > > +	ctx->q_data[V4L2_M2M_SRC].crop_height =3D DEFAULT_HEIGHT;
> > > +	ctx->q_data[V4L2_M2M_SRC].height =3D DEFAULT_HEIGHT;
> > > +	ctx->q_data[V4L2_M2M_SRC].bytesperline =3D
> > > +			get_bytesperline(DEFAULT_WIDTH, DEFAULT_HEIGHT,
> > > +					 ctx->q_data[V4L2_M2M_SRC].fmt,
> > > +					 dev->role);
> > > +	ctx->q_data[V4L2_M2M_SRC].sizeimage =3D
> > > +		get_sizeimage(ctx->q_data[V4L2_M2M_SRC].bytesperline,
> > > +			      ctx->q_data[V4L2_M2M_SRC].crop_width,
> > > +			      ctx->q_data[V4L2_M2M_SRC].height,
> > > +			      ctx->q_data[V4L2_M2M_SRC].fmt);
> > > +	ctx->q_data[V4L2_M2M_SRC].field =3D V4L2_FIELD_NONE;
> > > +
> > > +	ctx->q_data[V4L2_M2M_DST].crop_width =3D DEFAULT_WIDTH;
> > > +	ctx->q_data[V4L2_M2M_DST].crop_height =3D DEFAULT_HEIGHT;
> > > +	ctx->q_data[V4L2_M2M_DST].height =3D DEFAULT_HEIGHT;
> > > +	ctx->q_data[V4L2_M2M_DST].bytesperline =3D
> > > +			get_bytesperline(DEFAULT_WIDTH, DEFAULT_HEIGHT,
> > > +					 ctx->q_data[V4L2_M2M_DST].fmt,
> > > +					 dev->role);
> > > +	ctx->q_data[V4L2_M2M_DST].sizeimage =3D
> > > +		get_sizeimage(ctx->q_data[V4L2_M2M_DST].bytesperline,
> > > +			      ctx->q_data[V4L2_M2M_DST].crop_width,
> > > +			      ctx->q_data[V4L2_M2M_DST].height,
> > > +			      ctx->q_data[V4L2_M2M_DST].fmt);
> > > +	ctx->q_data[V4L2_M2M_DST].aspect_ratio.numerator =3D 1;
> > > +	ctx->q_data[V4L2_M2M_DST].aspect_ratio.denominator =3D 1;
> > > +	ctx->q_data[V4L2_M2M_DST].field =3D V4L2_FIELD_NONE;
> > > +
> > > +	ctx->colorspace =3D V4L2_COLORSPACE_REC709;
> > > +	ctx->bitrate =3D 10 * 1000 * 1000;
> > > +
> > > +	ctx->framerate_num =3D 30;
> > > +	ctx->framerate_denom =3D 1;
> > > +
> > > +	/* Initialise V4L2 contexts */
> > > +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> > > +	file->private_data =3D &ctx->fh;
> > > +	ctx->dev =3D dev;
> > > +	hdl =3D &ctx->hdl;
> > > +	switch (dev->role) {
> > > +	case ENCODE:
> > > +	{
> > > +		/* Encode controls */
> > > +		v4l2_ctrl_handler_init(hdl, 13);
> > > +
> > > +		v4l2_ctrl_new_std_menu(hdl, &bcm2835_codec_ctrl_ops,
> > > +				       V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
> > > +				       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
> > > +				       V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_MPEG_VIDEO_BITRATE,
> > > +				  25 * 1000, 25 * 1000 * 1000,
> > > +				  25 * 1000, 10 * 1000 * 1000);
> > > +		v4l2_ctrl_new_std_menu(hdl, &bcm2835_codec_ctrl_ops,
> > > +				       V4L2_CID_MPEG_VIDEO_HEADER_MODE,
> > > +				       V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> > > +				       0, V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME);
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER,
> > > +				  0, 1,
> > > +				  1, 0);
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_MPEG_VIDEO_H264_I_PERIOD,
> > > +				  0, 0x7FFFFFFF,
> > > +				  1, 60);
> > > +		v4l2_ctrl_new_std_menu(hdl, &bcm2835_codec_ctrl_ops,
> > > +				       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> > > +				       V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
> > > +				       ~(BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1)),
> > > +				       V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
> > > +		v4l2_ctrl_new_std_menu(hdl, &bcm2835_codec_ctrl_ops,
> > > +				       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > > +				       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +				       ~(BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> > > +					 BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
> > > +					V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
> > > +				  0, 51,
> > > +				  1, 20);
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
> > > +				  0, 51,
> > > +				  1, 51);
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME,
> > > +				  0, 0, 0, 0);
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_MPEG_VIDEO_B_FRAMES,
> > > +				  0, 0,
> > > +				  1, 0);
> > > +		ctx->gop_size =3D v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +						  V4L2_CID_MPEG_VIDEO_GOP_SIZE,
> > > +						  0, 0x7FFFFFFF, 1, 60);
> > > +		if (hdl->error) {
> > > +			rc =3D hdl->error;
> > > +			goto free_ctrl_handler;
> > > +		}
> > > +		ctx->fh.ctrl_handler =3D hdl;
> > > +		v4l2_ctrl_handler_setup(hdl);
> > > +	}
> > > +	break;
> > > +	case DECODE:
> > > +	{
> > > +		v4l2_ctrl_handler_init(hdl, 1 + dev->supported_fmts[0].num_entries=
=20
> > > * 2);
> > > +
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
> > > +				  1, 1, 1, 1);
> > > +		dec_add_profile_ctrls(dev, hdl);
> > > +		if (hdl->error) {
> > > +			rc =3D hdl->error;
> > > +			goto free_ctrl_handler;
> > > +		}
> > > +		ctx->fh.ctrl_handler =3D hdl;
> > > +		v4l2_ctrl_handler_setup(hdl);
> > > +	}
> > > +	break;
> > > +	case ISP:
> > > +	{
> > > +		v4l2_ctrl_handler_init(hdl, 2);
> > > +
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_HFLIP,
> > > +				  1, 0, 1, 0);
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_VFLIP,
> > > +				  1, 0, 1, 0);
> > > +		if (hdl->error) {
> > > +			rc =3D hdl->error;
> > > +			goto free_ctrl_handler;
> > > +		}
> > > +		ctx->fh.ctrl_handler =3D hdl;
> > > +		v4l2_ctrl_handler_setup(hdl);
> > > +	}
> > > +	break;
> > > +	case DEINTERLACE:
> > > +	{
> > > +		v4l2_ctrl_handler_init(hdl, 0);
> > > +	}
> > > +	break;
> > > +	case ENCODE_IMAGE:
> > > +	{
> > > +		/* Encode image controls */
> > > +		v4l2_ctrl_handler_init(hdl, 1);
> > > +
> > > +		v4l2_ctrl_new_std(hdl, &bcm2835_codec_ctrl_ops,
> > > +				  V4L2_CID_JPEG_COMPRESSION_QUALITY,
> > > +				  1, 100,
> > > +				  1, 80);
> > > +		if (hdl->error) {
> > > +			rc =3D hdl->error;
> > > +			goto free_ctrl_handler;
> > > +		}
> > > +		ctx->fh.ctrl_handler =3D hdl;
> > > +		v4l2_ctrl_handler_setup(hdl);
> > > +	}
> > > +	break;
> > > +	case NUM_ROLES:
> > > +	break;
> > > +	}
> > > +
> > > +	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(dev->m2m_dev, ctx, &queue_ini=
t);
> > > +
> > > +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> > > +		rc =3D PTR_ERR(ctx->fh.m2m_ctx);
> > > +
> > > +		goto free_ctrl_handler;
> > > +	}
> > > +
> > > +	/* Set both queues as buffered as we have buffering in the VPU. Tha=
t
> > > +	 * means that we will be scheduled whenever either an input or=20
> > > output
> > > +	 * buffer is available (otherwise one of each are required).
> > > +	 */
> > > +	v4l2_m2m_set_src_buffered(ctx->fh.m2m_ctx, true);
> > > +	v4l2_m2m_set_dst_buffered(ctx->fh.m2m_ctx, true);
> >=20
> > Makes a lot of sense for this firmware (for all roles).
> >=20
> > > +
> > > +	v4l2_fh_add(&ctx->fh);
> > > +	atomic_inc(&dev->num_inst);
> > > +
> > > +	mutex_unlock(&dev->dev_mutex);
> > > +	return 0;
> > > +
> > > +free_ctrl_handler:
> > > +	v4l2_ctrl_handler_free(hdl);
> > > +	kfree(ctx);
> > > +open_unlock:
> > > +	mutex_unlock(&dev->dev_mutex);
> > > +	return rc;
> > > +}
> > > +
> > > +static int bcm2835_codec_release(struct file *file)
> > > +{
> > > +	struct bcm2835_codec_dev *dev =3D video_drvdata(file);
> > > +	struct bcm2835_codec_ctx *ctx =3D file2ctx(file);
> > > +
> > > +	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: Releasing instance %p\n",
> > > +		 __func__, ctx);
> > > +
> > > +	v4l2_fh_del(&ctx->fh);
> > > +	v4l2_fh_exit(&ctx->fh);
> > > +	v4l2_ctrl_handler_free(&ctx->hdl);
> > > +	mutex_lock(&dev->dev_mutex);
> > > +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> > > +
> > > +	if (ctx->component)
> > > +		vchiq_mmal_component_finalise(dev->instance, ctx->component);
> > > +
> > > +	mutex_unlock(&dev->dev_mutex);
> > > +	kfree(ctx);
> > > +
> > > +	atomic_dec(&dev->num_inst);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct v4l2_file_operations bcm2835_codec_fops =3D {
> > > +	.owner		=3D THIS_MODULE,
> > > +	.open		=3D bcm2835_codec_open,
> > > +	.release	=3D bcm2835_codec_release,
> > > +	.poll		=3D v4l2_m2m_fop_poll,
> > > +	.unlocked_ioctl	=3D video_ioctl2,
> > > +	.mmap		=3D v4l2_m2m_fop_mmap,
> > > +};
> > > +
> > > +static const struct video_device bcm2835_codec_videodev =3D {
> > > +	.name		=3D MEM2MEM_NAME,
> > > +	.vfl_dir	=3D VFL_DIR_M2M,
> > > +	.fops		=3D &bcm2835_codec_fops,
> > > +	.ioctl_ops	=3D &bcm2835_codec_ioctl_ops,
> > > +	.minor		=3D -1,
> > > +	.release	=3D video_device_release_empty,
> > > +};
> > > +
> > > +static const struct v4l2_m2m_ops m2m_ops =3D {
> > > +	.device_run	=3D device_run,
> > > +	.job_ready	=3D job_ready,
> > > +	.job_abort	=3D job_abort,
> > > +};
> > > +
> > > +/* Size of the array to provide to the VPU when asking for the list=
=20
> > > of supported
> > > + * formats.
> > > + * The ISP component currently advertises 62 input formats, so add a=
=20
> > > small
> > > + * overhead on that.
> > > + */
> > > +#define MAX_SUPPORTED_ENCODINGS 70
> > > +
> > > +/* Populate dev->supported_fmts with the formats supported by those=
=20
> > > ports. */
> > > +static int bcm2835_codec_get_supported_fmts(struct bcm2835_codec_dev=
=20
> > > *dev)
> > > +{
> > > +	struct bcm2835_codec_fmt *list;
> > > +	struct vchiq_mmal_component *component;
> > > +	u32 fourccs[MAX_SUPPORTED_ENCODINGS];
> > > +	u32 param_size =3D sizeof(fourccs);
> > > +	unsigned int i, j, num_encodings;
> > > +	int ret;
> > > +
> > > +	ret =3D vchiq_mmal_component_init(dev->instance,=20
> > > components[dev->role],
> > > +					&component);
> > > +	if (ret < 0) {
> > > +		v4l2_err(&dev->v4l2_dev, "%s: failed to create component %s\n",
> > > +			 __func__, components[dev->role]);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	ret =3D vchiq_mmal_port_parameter_get(dev->instance,
> > > +					    &component->input[0],
> > > +					    MMAL_PARAMETER_SUPPORTED_ENCODINGS,
> > > +					    &fourccs,
> > > +					    &param_size);
> > > +
> > > +	if (ret) {
> > > +		if (ret =3D=3D MMAL_MSG_STATUS_ENOSPC) {
> > > +			v4l2_err(&dev->v4l2_dev,
> > > +				 "%s: port has more encodings than we provided space for. Some=
=20
> > > are dropped (%zu vs %u).\n",
> > > +				 __func__, param_size / sizeof(u32),
> > > +				 MAX_SUPPORTED_ENCODINGS);
> > > +			num_encodings =3D MAX_SUPPORTED_ENCODINGS;
> > > +		} else {
> > > +			v4l2_err(&dev->v4l2_dev, "%s: get_param ret %u.\n",
> > > +				 __func__, ret);
> > > +			ret =3D -EINVAL;
> > > +			goto destroy_component;
> > > +		}
> > > +	} else {
> > > +		num_encodings =3D param_size / sizeof(u32);
> > > +	}
> > > +
> > > +	/* Assume at this stage that all encodings will be supported in=20
> > > V4L2.
> > > +	 * Any that aren't supported will waste a very small amount of=20
> > > memory.
> > > +	 */
> > > +	list =3D devm_kzalloc(&dev->device->dev,
> > > +			    sizeof(struct bcm2835_codec_fmt) * num_encodings,
> > > +			    GFP_KERNEL);
> > > +	if (!list) {
> > > +		ret =3D -ENOMEM;
> > > +		goto destroy_component;
> > > +	}
> > > +	dev->supported_fmts[0].list =3D list;
> > > +
> > > +	for (i =3D 0, j =3D 0; i < num_encodings; i++) {
> > > +		const struct bcm2835_codec_fmt *fmt =3D get_fmt(fourccs[i]);
> > > +
> > > +		if (fmt) {
> > > +			list[j] =3D *fmt;
> > > +			j++;
> > > +		}
> > > +	}
> > > +	dev->supported_fmts[0].num_entries =3D j;
> > > +
> > > +	param_size =3D sizeof(fourccs);
> > > +	ret =3D vchiq_mmal_port_parameter_get(dev->instance,
> > > +					    &component->output[0],
> > > +					    MMAL_PARAMETER_SUPPORTED_ENCODINGS,
> > > +					    &fourccs,
> > > +					    &param_size);
> > > +
> > > +	if (ret) {
> > > +		if (ret =3D=3D MMAL_MSG_STATUS_ENOSPC) {
> > > +			v4l2_err(&dev->v4l2_dev,
> > > +				 "%s: port has more encodings than we provided space for. Some=
=20
> > > are dropped (%zu vs %u).\n",
> > > +				 __func__, param_size / sizeof(u32),
> > > +				 MAX_SUPPORTED_ENCODINGS);
> > > +			num_encodings =3D MAX_SUPPORTED_ENCODINGS;
> > > +		} else {
> > > +			ret =3D -EINVAL;
> > > +			goto destroy_component;
> > > +		}
> > > +	} else {
> > > +		num_encodings =3D param_size / sizeof(u32);
> > > +	}
> > > +	/* Assume at this stage that all encodings will be supported in=20
> > > V4L2. */
> > > +	list =3D devm_kzalloc(&dev->device->dev,
> > > +			    sizeof(struct bcm2835_codec_fmt) * num_encodings,
> > > +			    GFP_KERNEL);
> > > +	if (!list) {
> > > +		ret =3D -ENOMEM;
> > > +		goto destroy_component;
> > > +	}
> > > +	dev->supported_fmts[1].list =3D list;
> > > +
> > > +	for (i =3D 0, j =3D 0; i < num_encodings; i++) {
> > > +		const struct bcm2835_codec_fmt *fmt =3D get_fmt(fourccs[i]);
> > > +
> > > +		if (fmt) {
> > > +			list[j] =3D *fmt;
> > > +			j++;
> > > +		}
> > > +	}
> > > +	dev->supported_fmts[1].num_entries =3D j;
> > > +
> > > +	ret =3D 0;
> > > +
> > > +destroy_component:
> > > +	vchiq_mmal_component_finalise(dev->instance, component);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int bcm2835_codec_create(struct bcm2835_codec_driver *drv,
> > > +				struct bcm2835_codec_dev **new_dev,
> > > +				enum bcm2835_codec_role role)
> > > +{
> > > +	struct vchiq_device *device =3D drv->device;
> > > +	struct bcm2835_codec_dev *dev;
> > > +	struct video_device *vfd;
> > > +	int function;
> > > +	int video_nr;
> > > +	int ret;
> > > +
> > > +	dev =3D devm_kzalloc(&device->dev, sizeof(*dev), GFP_KERNEL);
> > > +	if (!dev)
> > > +		return -ENOMEM;
> > > +
> > > +	dev->device =3D device;
> > > +
> > > +	dev->role =3D role;
> > > +
> > > +	ret =3D vchiq_mmal_init(&dev->instance);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret =3D bcm2835_codec_get_supported_fmts(dev);
> > > +	if (ret)
> > > +		goto vchiq_finalise;
> > > +
> > > +	atomic_set(&dev->num_inst, 0);
> > > +	mutex_init(&dev->dev_mutex);
> > > +
> > > +	/* Initialise the video device */
> > > +	dev->vfd =3D bcm2835_codec_videodev;
> > > +
> > > +	vfd =3D &dev->vfd;
> > > +	vfd->lock =3D &dev->dev_mutex;
> > > +	vfd->v4l2_dev =3D &dev->v4l2_dev;
> > > +	vfd->device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING=
;
> > > +	vfd->v4l2_dev->mdev =3D &drv->mdev;
> > > +
> > > +	ret =3D v4l2_device_register(&device->dev, &dev->v4l2_dev);
> > > +	if (ret)
> > > +		goto vchiq_finalise;
> > > +
> > > +	dev->max_w =3D MAX_W_CODEC;
> > > +	dev->max_h =3D MAX_H_CODEC;
> > > +
> > > +	switch (role) {
> > > +	case DECODE:
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_S_PARM);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_G_PARM);
> > > +		function =3D MEDIA_ENT_F_PROC_VIDEO_DECODER;
> > > +		video_nr =3D decode_video_nr;
> > > +		break;
> > > +	case ENCODE:
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_DECODER_CMD);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_TRY_DECODER_CMD);
> > > +		function =3D MEDIA_ENT_F_PROC_VIDEO_ENCODER;
> > > +		video_nr =3D encode_video_nr;
> > > +		break;
> > > +	case ISP:
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_DECODER_CMD);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_TRY_DECODER_CMD);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_S_PARM);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_G_PARM);
> > > +		function =3D MEDIA_ENT_F_PROC_VIDEO_SCALER;
> >=20
> > Strictly speaking, this is also a pixel format converter, should we add=
=20
> > 2
> > virtual entity to express this ?
>=20
> I don't know, would that actually give any benefit?

Its pretty rare that stateful codecs have a media controller and read only
topology. But in general, the identification of your driver is extremely
difficult. Having proper topology to express the functions is the only way =
in
the future we can have generic userspace using it. As an example, in gstrea=
mer
we have v4l2transform, which only support 1:1, but it get confused and may =
use
deinterlacer driver.

The alternative is just to drop the media controller for now  I suppose ...
Unless this mapping is already used elsewhere.

>=20
> > > +		video_nr =3D isp_video_nr;
> > > +		dev->max_w =3D MAX_W_ISP;
> > > +		dev->max_h =3D MAX_H_ISP;
> > > +		break;
> > > +	case DEINTERLACE:
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_DECODER_CMD);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_TRY_DECODER_CMD);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_S_PARM);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_G_PARM);
> > > +		function =3D MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> >=20
> > Its rare that stateful drivers implement a media controller, but now=
=20
> > that you
> > do, can we introduce proper functions for deinterlacer ? This would be=
=20
> > extremely
> > handy to standardise upon, since they are not 1:1, hence more complex=
=20
> > userspace
> > is needed (the reason why v4l2transform does not work).
>=20
> As a noob, I don't feel confident to have any useful ideas on this, one=
=20
> way or another. It would be great if someone weighed in on this.

Just like any upstreaming work, sometimes removing features is best to get =
going
:-D

>=20
> > > +		video_nr =3D deinterlace_video_nr;
> > > +		break;
> > > +	case ENCODE_IMAGE:
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_DECODER_CMD);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_TRY_DECODER_CMD);
> > > +		function =3D MEDIA_ENT_F_PROC_VIDEO_ENCODER;
> > > +		video_nr =3D encode_image_nr;
> > > +		break;
> > > +	default:
> > > +		ret =3D -EINVAL;
> > > +		goto unreg_dev;
> > > +	}
> > > +
> > > +	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, video_nr);
> > > +	if (ret) {
> > > +		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> > > +		goto unreg_dev;
> > > +	}
> > > +
> > > +	video_set_drvdata(vfd, dev);
> > > +	snprintf(vfd->name, sizeof(vfd->name), "%s-%s",
> > > +		 bcm2835_codec_videodev.name, roles[role]);
> > > +	v4l2_info(&dev->v4l2_dev, "Device registered as /dev/video%d\n",
> > > +		  vfd->num);
> > > +
> > > +	*new_dev =3D dev;
> > > +
> > > +	dev->m2m_dev =3D v4l2_m2m_init(&m2m_ops);
> > > +	if (IS_ERR(dev->m2m_dev)) {
> > > +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
> > > +		ret =3D PTR_ERR(dev->m2m_dev);
> > > +		goto err_m2m;
> > > +	}
> > > +
> > > +	ret =3D v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,=20
> > > function);
> > > +	if (ret)
> > > +		goto err_m2m;
> > > +
> > > +	v4l2_info(&dev->v4l2_dev, "Loaded V4L2 %s\n",
> > > +		  roles[role]);
> > > +	return 0;
> > > +
> > > +err_m2m:
> > > +	v4l2_m2m_release(dev->m2m_dev);
> > > +	video_unregister_device(&dev->vfd);
> > > +unreg_dev:
> > > +	v4l2_device_unregister(&dev->v4l2_dev);
> > > +vchiq_finalise:
> > > +	vchiq_mmal_finalise(dev->instance);
> > > +	return ret;
> > > +}
> > > +
> > > +static int bcm2835_codec_destroy(struct bcm2835_codec_dev *dev)
> > > +{
> > > +	if (!dev)
> > > +		return -ENODEV;
> > > +
> > > +	v4l2_info(&dev->v4l2_dev, "Removing " MEM2MEM_NAME ", %s\n",
> > > +		  roles[dev->role]);
> > > +	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> > > +	v4l2_m2m_release(dev->m2m_dev);
> > > +	video_unregister_device(&dev->vfd);
> > > +	v4l2_device_unregister(&dev->v4l2_dev);
> > > +	vchiq_mmal_finalise(dev->instance);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int bcm2835_codec_probe(struct vchiq_device *device)
> > > +{
> > > +	struct bcm2835_codec_driver *drv;
> > > +	struct media_device *mdev;
> > > +	int ret =3D 0;
> > > +
> > > +	drv =3D devm_kzalloc(&device->dev, sizeof(*drv), GFP_KERNEL);
> > > +	if (!drv)
> > > +		return -ENOMEM;
> > > +
> > > +	drv->device =3D device;
> > > +	mdev =3D &drv->mdev;
> > > +	mdev->dev =3D &device->dev;
> > > +
> > > +	strscpy(mdev->model, "bcm2835-codec", sizeof(mdev->model));
> > > +	strscpy(mdev->bus_info, "platform:bcm2835-codec",
> > > +		sizeof(mdev->bus_info));
> > > +
> > > +	/* This should return the vgencmd version information or such .. */
> > > +	mdev->hw_revision =3D 1;
> > > +	media_device_init(mdev);
> > > +
> > > +	ret =3D bcm2835_codec_create(drv, &drv->decode, DECODE);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > +	ret =3D bcm2835_codec_create(drv, &drv->encode, ENCODE);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > +	ret =3D bcm2835_codec_create(drv, &drv->isp, ISP);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > +	ret =3D bcm2835_codec_create(drv, &drv->deinterlace, DEINTERLACE);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > +	ret =3D bcm2835_codec_create(drv, &drv->encode_image, ENCODE_IMAGE)=
;
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > +	/* Register the media device node */
> > > +	if (media_device_register(mdev) < 0)
> > > +		goto out;
> > > +
> > > +	vchiq_set_drvdata(device, drv);
> > > +
> > > +	return 0;
> > > +
> > > +out:
> > > +	if (drv->encode_image) {
> > > +		bcm2835_codec_destroy(drv->encode_image);
> > > +		drv->encode_image =3D NULL;
> > > +	}
> > > +	if (drv->deinterlace) {
> > > +		bcm2835_codec_destroy(drv->deinterlace);
> > > +		drv->deinterlace =3D NULL;
> > > +	}
> > > +	if (drv->isp) {
> > > +		bcm2835_codec_destroy(drv->isp);
> > > +		drv->isp =3D NULL;
> > > +	}
> > > +	if (drv->encode) {
> > > +		bcm2835_codec_destroy(drv->encode);
> > > +		drv->encode =3D NULL;
> > > +	}
> > > +	if (drv->decode) {
> > > +		bcm2835_codec_destroy(drv->decode);
> > > +		drv->decode =3D NULL;
> > > +	}
> > > +	return ret;
> > > +}
> > > +
> > > +static void bcm2835_codec_remove(struct vchiq_device *device)
> > > +{
> > > +	struct bcm2835_codec_driver *drv =3D vchiq_get_drvdata(device);
> > > +
> > > +	media_device_unregister(&drv->mdev);
> > > +
> > > +	bcm2835_codec_destroy(drv->encode_image);
> > > +
> > > +	bcm2835_codec_destroy(drv->deinterlace);
> > > +
> > > +	bcm2835_codec_destroy(drv->isp);
> > > +
> > > +	bcm2835_codec_destroy(drv->encode);
> > > +
> > > +	bcm2835_codec_destroy(drv->decode);
> > > +
> > > +	media_device_cleanup(&drv->mdev);
> > > +}
> > > +
> > > +static struct vchiq_device_id device_id_table[] =3D {
> > > +        { .name =3D "bcm2835-codec" },
> > > +        {}
> > > +};
> > > +MODULE_DEVICE_TABLE(vchiq, device_id_table);
> > > +
> > > +static struct vchiq_driver bcm2835_v4l2_codec =3D {
> > > +	.probe =3D bcm2835_codec_probe,
> > > +	.remove =3D bcm2835_codec_remove,
> > > +	.id_table =3D device_id_table,
> > > +	.driver =3D {
> > > +		   .name =3D BCM2835_V4L_CODEC_NAME,
> > > +	},
> > > +};
> > > +
> > > +module_vchiq_driver(bcm2835_v4l2_codec);
> > > +
> > > +MODULE_DESCRIPTION("BCM2835 codec V4L2 driver");
> > > +MODULE_AUTHOR("Dave Stevenson, <dave.stevenson@raspberrypi.com>");
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_VERSION("0.0.1");
> > > diff --git=20
> > > a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=20
> > > b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > index eb15aa011a22..a6764dfd57f2 100644
> > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > @@ -74,6 +74,7 @@ struct vchiq_state g_state;
> > >   */
> > >  static struct vchiq_device *bcm2835_audio;
> > >  static struct vchiq_device *bcm2835_camera;
> > > +static struct vchiq_device *bcm2835_codec;
> > >  static struct vchiq_device *bcm2835_isp;
> > >  static struct vchiq_device *vcsm_cma;
> > >=20
> > > @@ -1856,6 +1857,7 @@ static int vchiq_probe(struct platform_device=
=20
> > > *pdev)
> > >  	vcsm_cma =3D vchiq_device_register(&pdev->dev, "vcsm-cma");
> > >  	bcm2835_audio =3D vchiq_device_register(&pdev->dev, "bcm2835-audio"=
);
> > >  	bcm2835_camera =3D vchiq_device_register(&pdev->dev,=20
> > > "bcm2835-camera");
> > > +	bcm2835_codec =3D vchiq_device_register(&pdev->dev, "bcm2835-codec"=
);
> > >  	bcm2835_isp =3D vchiq_device_register(&pdev->dev, "bcm2835-isp");
> > >=20
> > >  	return 0;
> > > @@ -1870,6 +1872,7 @@ static void vchiq_remove(struct platform_device=
=20
> > > *pdev)
> > >  {
> > >  	vchiq_device_unregister(bcm2835_audio);
> > >  	vchiq_device_unregister(bcm2835_camera);
> > > +	vchiq_device_unregister(bcm2835_codec);
> > >  	vchiq_device_unregister(bcm2835_isp);
> > >  	vchiq_device_unregister(vcsm_cma);
> > >  	vchiq_debugfs_deinit();
> > > diff --git=20
> > > a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h=20
> > > b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
> > > index 5007625981a7..729b3d6f3021 100644
> > > --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
> > > +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
> > > @@ -223,6 +223,8 @@ enum mmal_parameter_camera_type {
> > >  	MMAL_PARAMETER_SHUTTER_SPEED,
> > >  		/**< Takes a @ref MMAL_PARAMETER_AWB_GAINS_T */
> > >  	MMAL_PARAMETER_CUSTOM_AWB_GAINS,
> > > +		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
> > > +	MMAL_PARAMETER_JPEG_IJG_SCALING,
> > >  		/**< Takes a @ref MMAL_PARAMETER_CAMERA_SETTINGS_T */
> > >  	MMAL_PARAMETER_CAMERA_SETTINGS,
> > >  		/**< Takes a @ref MMAL_PARAMETER_PRIVACY_INDICATOR_T */
> > > @@ -674,6 +676,12 @@ enum mmal_parameter_video_type {
> > >=20
> > >  	/**< Take a @ref MMAL_PARAMETER_BOOLEAN_T */
> > >  	MMAL_PARAMETER_VIDEO_ENCODE_HEADERS_WITH_FRAME,
> > > +
> > > +	/**< Take a @ref MMAL_PARAMETER_BOOLEAN_T */
> > > +	MMAL_PARAMETER_VIDEO_VALIDATE_TIMESTAMPS,
> > > +
> > > +	/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
> > > +	MMAL_PARAMETER_VIDEO_STOP_ON_PAR_COLOUR_CHANGE,
> > >  };
> > >=20
> > >  /** Valid mirror modes */
> >=20
> > Overall, I'm not a big fan of the roles, this could certainly be=20
> > improved, but
> > read this as my personal view. M2M jobs lifetime don't match driver=20
> > activity,
> > but such is the case for most stateful driver (except wave5). I haven't=
=20
> > seen
> > power management, is that entirely handled by the firmware ?
>=20
> Sorry, no clue on power management (yet). It seems I should take a peek=
=20
> at how wave5 is doing things.

Might not be needed, e.g. it might entirely be generically done against the
firmware. Feel free to just ignore that comment.

>=20
> > One thing you are missing is a TODO for this driver to get out of=20
> > staging. We
> > don't want to keep drivers in staging forever. The TODO is meant to be=
=20
> > an agreed
> > set of changes needed to move it.
>=20
> Sorry, I had removed it from the patches, since it was empty, i'll=20
> revert that. I assume it's meant for me to add stuff to this depending=
=20
> on my replies to these comments on these RFC's?

Basically, if maintainers accept your staging request, you don't have to fi=
x all
the things reviewers have commented on just yet, you can get that code merg=
ed
and it can be fixed later on. Usually, we stage driver that needs work, but=
 are
usable, in order to make it easier for a larger group of dev to cooperate. =
We
also stage drivers that depends on other staged drivers.

Nicolas

