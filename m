Return-Path: <linux-media+bounces-19134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D23A0991DF8
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2024 12:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65D84B2105D
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2024 10:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81C61741F0;
	Sun,  6 Oct 2024 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfVOqNfu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E94C91;
	Sun,  6 Oct 2024 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728211843; cv=none; b=t7hUcA1UvtryIFkiY+OGuQvMcLts1yEfXgwKyNcR5tfdvf2Mossw7x9JSjrpIo4xipQW9WlGnhvz9L0PvNNXn21+XAfmufi/ffT5lj7b2vGJZ9vJ/RDsZTypUrNEu/mSM8F5KyfOfbQVerxsHmeuXixBOIC8TtXjq+L/XrvNul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728211843; c=relaxed/simple;
	bh=XG8y5FNGAgW+kSkrfVcvbuP7OLkRpyxIDekKAKJNXGQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=MnTvSftCoz8CLDdJYtBcQqbxIi28et7Uw7BpUHiO3xmZtj1KBzMggcz0ib4j2L2QC1x0PZRqBOGQx2jP/nwXo0Oq3Za4SHV64IqNhcRoFc/OVx03RwNnFqu9TKjW/htGe6aEpfh9F1pSj1prkNM0eSyyGuMgVboPG3YiV2jkO8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfVOqNfu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42e82f7f36aso29241005e9.0;
        Sun, 06 Oct 2024 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728211840; x=1728816640; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gIyOrN2gQ72dK3NGr3DACHMSZ2HkmBOjHKgddsw4tbo=;
        b=XfVOqNfutVnN1IixuBdi8wZZwI+7plzx7D/V7SpdVw0+C6bwClDeWD1+i8ctflwZh2
         NwwABeh9TFK6yvNHwLPnRcQ/u3UsEucJwMpaLOPk80tnx1q18HzOMC1Jy3dq6b4PX8Ik
         3LR7MlfE5NbGMjIAUfmuI2fjFoI952h0HwuxZD8yytz3KBwnk4MsgwsRpvcMhf61MmTA
         27nuhWDX2u0I2hk8qfTNz8iguriQARJnSWGh6Y2yTpBhZg0FlEV95j2RoIQBgSwx/be8
         07k+uH9GOmHcu+YhAL0lDoGGJlYOzB854WkQCkOS8pduiGZQqPvjQGlGL3e5tGmhiyuy
         mbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728211840; x=1728816640;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIyOrN2gQ72dK3NGr3DACHMSZ2HkmBOjHKgddsw4tbo=;
        b=YsmY8oulNV+1+aXeqehXqyPHvyo74yfM/VSrT8VLZPh7kigeQJ//HWRhWBsgXKreU/
         2tOk3cq76CfHHlb5rkkz6mq3X+i1vBOoboX90fGVlxrj+zviFq0ruzpClmIWpy5HMg8l
         ijwS9YiAsWMClHLq5FvBj+m1CXRfyU/0sXaDo6XEijKYG/IGjj0NfOljH7pEgveRY+M8
         F8b1m4n/K+OI+pjdRYZXbO+UFCt4PwqYkesGgxYYS0K1KgvYIHC6IXBARFaQYl2FpZwQ
         FxB47US4HnnlffQPnrLhVhoEuQNxNTaMkxS5Rk7Y7Ronte3Hg1UlgGS1CqolRf8WQ60Y
         jDUw==
X-Forwarded-Encrypted: i=1; AJvYcCV/S2je/HtpSOi4bF6mGxmx6Ab2JTy8fdMMsQYQpn7hyfo5rpLCAHG9TsWGpUB5vgTJecKHjaBXE1xMMKY=@vger.kernel.org, AJvYcCVDOdRsm+IL4ucQd31EifwKz4EYMsNdgagE8sJjpB4CX70B1C8zsKxzkVrhvIGZ6cg4YEhIihXh7LhkQAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPoDKWCpTLLs+Kh7XUogv0FXqn/oSevKFuv997W76KduZKZ58
	inT4r7IaWF1cCJc/1iekKUSHb1H+MXgOlleCZIEnJXPB5xW2a9RKw6AsFH3dll/Eu00EQdwtRl3
	448I93tLckwhwdcEraHc33eRezJo=
X-Google-Smtp-Source: AGHT+IGQTc4XX8OGd7V9Sg4UasH0H0mpXnZ6exmpCi9FwjtNQPh35SoCNtlyI5IqDIQDnmK42xYfi7ao2i+v4rTH+KM=
X-Received: by 2002:adf:8b14:0:b0:37c:ca21:bc5d with SMTP id
 ffacd0b85a97d-37d0e7388b4mr4692965f8f.17.1728211839711; Sun, 06 Oct 2024
 03:50:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ulrich Drepper <drepper@gmail.com>
Date: Sun, 6 Oct 2024 12:50:28 +0200
Message-ID: <CAOPLpQdP_=UZbOfAdzH9Nn_ZJADxJGLOT2nowTtRATwNYSGkFw@mail.gmail.com>
Subject: PROBLEM: WARN_ON triggers in v4l_querycap with BlackMagic atem
 console connected via USB
To: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	naush@raspberrypi.com, benjamin.gaignard@collabora.com, 
	jeanmichel.hautbois@ideasonboard.com, linux-media@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I cannot really say when this problem started but I know that perhaps
six months back (or a bit more) I used the console successfully as a
video source device (webcam).  This is a ATEM Mini Pro which has a
large number of USB interfaces.  What trips up is videodev.  Various
userlevel programs (uvcdynctrl, chromium) notice the device being
added and use ioctl(), triggering the problem.

This is with the current Fedora x86_64 kernel (6.10.12) but a) it
happens for a while now and b) as far as I can see this is just the
upstream code, no local changes.

The call trace is:

Call Trace:
 <TASK>
 ? v4l_querycap+0x119/0x140 [videodev]
 ? __warn.cold+0x8e/0xe8
 ? v4l_querycap+0x119/0x140 [videodev]
 ? report_bug+0xff/0x140
 ? handle_bug+0x3c/0x80
 ? exc_invalid_op+0x17/0x70
 ? asm_exc_invalid_op+0x1a/0x20
 ? v4l_querycap+0x119/0x140 [videodev]
 __video_do_ioctl+0x518/0x630 [videodev]
 video_usercopy+0x1f1/0x7a0 [videodev]

I traced the offending code to an 'ud2' instruction (makes sense,
undefined) which is reached from this code in
drivers/media/v4l2-core/v4l2-ioctl.c (v4l_querycap):

WARN_ON((cap->capabilities &
      (vfd->device_caps | V4L2_CAP_DEVICE_CAPS)) !=
      (vfd->device_caps | V4L2_CAP_DEVICE_CAPS));

The asm code is:

    747e:       8b 73 54                mov    0x54(%rbx),%esi
    7481:       81 ca 00 00 00 80       or     $0x80000000,%edx
    7487:       48 b9 00 00 20 00 00    movabs $0x20000000200000,%rcx
    748e:       00 20 00
    7491:       48 0b 4b 54             or     0x54(%rbx),%rcx
    7495:       21 d6                   and    %edx,%esi
    7497:       39 f2                   cmp    %esi,%edx
    7499:       75 6e                   jne    7509 <v4l_querycap+0x119>

where 7509 is the address of the ud2 instruction.

The register dump shows

RDX: 0000000085008003 RSI: 0000000085008002

which, if I'm right, means that cap->capabilities has the extra bit

#define V4L2_CAP_VIDEO_CAPTURE          0x00000001  /* Is a video
capture device */

set.

I don't know what 'ops' points to in the code.  It seems to me that
the bit is set in the

ops->vidioc_querycap(file, fh, cap);

call just preceding the test.

Just going by the name of the capability, it seems that the bit should
be set as this device is used as a camera as well so maybe the
information which comes from the call the

struct video_device *vfd = video_devdata(file);

is incomplete?  Or the test WARN_ON condition is actually incorrect?


Any idea?  I can try to run more tests if someone can tell me how to proceed.

Thanks.

