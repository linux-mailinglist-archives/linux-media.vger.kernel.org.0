Return-Path: <linux-media+bounces-25236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B2DA1AE4C
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 02:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA7D3ABB6E
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 01:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88B61D516A;
	Fri, 24 Jan 2025 01:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIaQj0C/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AD560890
	for <linux-media@vger.kernel.org>; Fri, 24 Jan 2025 01:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737683460; cv=none; b=PZnJQPzbGiojqZHgSBGL+RGO7C1xCAKRl5ifMe6vCum0+IN2gTDeD6TY4QruG+Sg94TUr1i3tP6i5BMvt7qNVmIrQnkYVC6K0hmW8Nn47f9cahdjGLyNuVlXXQ+UkYkUHOCT3wvqn7g94xjOc2CNuJLPkyMTUWeLGbbbONYhoGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737683460; c=relaxed/simple;
	bh=TCX+8mSijL+dFhOxIPRznZRTr4dPFDhcuZ6CusWdWXw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=M0w6/UpOtqANs8Ywsz+2uMuWi5ff0E1A103/4mHpKxB3xq38Rit2Ys66ns25Fglra1oASZyc/Fwqduplo0H7MCvbnkY1VKj7WWTAOp+ynGPwqAp1hvEJkXaMMdxtnkSxAechjzydXivi8cp1bvng0Q9WQDbcfJxuTVUuegIAQLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIaQj0C/; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e53537d8feeso2438231276.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 17:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737683457; x=1738288257; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TCX+8mSijL+dFhOxIPRznZRTr4dPFDhcuZ6CusWdWXw=;
        b=kIaQj0C/xFlFBHLru2vTiX2qLMaqBlV6Bi1spf1DcCsodfZvea9+NLGNUDrWpQKKs6
         cUjMdeeOADVTjIkh97WOaAA/WOwX/mP+OrytcM5SUuaQAeUD0G70DlWlN2RHFmf2DD/S
         0KdS5q7NjQyojlujufKMLhVx78unKdOkSCOKOgCNDIDEyuzYWgOFgqsUpuzdoE8gvVuY
         x1uAodAvTReumeUHnw4a6t0vqwrWgvNu55+ESopjd/VcyhQxVeivCVNIz39y9XIJDOnC
         C4Eh4GRb5mqmz01J1ftt79YSKdXjAxVuzHMV+VOHKTw3s4ATK2dCoaI9/3FXbw+0PmfR
         z/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737683457; x=1738288257;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCX+8mSijL+dFhOxIPRznZRTr4dPFDhcuZ6CusWdWXw=;
        b=Q1TSmArduTy0r+ozp6RKYllXtWAfwB7IJVX05H3A2hHvLA7J09Hq+z1b7nNcoRxMP9
         tkb/cMbcbCutz+5n6jSQWjogqeYcFOV7O4r2g9QIkbHGjoA6DmxjfS/BrwJmLGAfFYzw
         ZR7ayD6Lm3eEphqWU4NS019c5pNYIvtKQg6wkaIu/kKbtwgo+Up9Qu0ytg9xbWAoD5t3
         s3bg4FMwzPWsTHguLg1mJSHQFeiHA80j5DarwEDONXzdlSXRnOaq2Wr3HNcOrcMPOitL
         A8NgHNt6uzGJh8likgYXC+fpu+JwRBwCLmcfcxmj8zm5bHVm8WXQzlDlRDSprGEn/g/J
         o2Ow==
X-Gm-Message-State: AOJu0Yz8N2/6MhS3XcKEkLXu+wawXxpDJIIdAm3k0vJONeulVqiQQFuL
	LtTEMfZmVKed0+t2MAozfOAwrEmmbT1XIKAaMb2RUs81klc6AckRTLSf68mYWCekXOzMj5QWJ4W
	xUoiGqwpxk2WwKT7MJ9h52Ylm5b93a4S4
X-Gm-Gg: ASbGncs8u+vZw/D6Tqen+mV+LTkx7kyKTooPYK+rXrAI5kQbinMntSmllsmVq62VvOC
	OA02qlRsWt6OoMc8ZRevu0RtZbqr3lyxKSE2HoyS2OWrDmvWCyvNRQbh3A/Rr
X-Google-Smtp-Source: AGHT+IGCnn124DvsbJGNR2Ki7AlxKj2ebGrmU+kGYs5S1Go1FvHodlgDTSl0R3yAwwl3keR6jCLdOsPtPIuXnnN2xhM=
X-Received: by 2002:a05:6902:1387:b0:e49:5f2d:e739 with SMTP id
 3f1490d57ef6-e57b0e1bc8bmr22717367276.0.1737683457492; Thu, 23 Jan 2025
 17:50:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stephen Wade <stephematician@gmail.com>
Date: Fri, 24 Jan 2025 12:50:46 +1100
X-Gm-Features: AWEUYZmguNiCKI6lfEKrvo02uGbZyhonNi_xHkY32v73oNCHQ5Fv91wcIZOhIyk
Message-ID: <CAHG+78wbrf9nK+drzt35Ev-QHsz=Jzqh1y_y7ETKBEiG5FPyLQ@mail.gmail.com>
Subject: v4l2-compliance: input and output versus Media UAPI V4L doc
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is my first question - any feedback or direction is welcome.

I am trying to 'square' the documentation available for Media UAPI V4L
with the expected behaviour.

In particular I'm trying to match the following line from Media UAPI
Video for Linux =C2=A71.1.3:

> Today each V4L2 device node supports just one function.

with the statement in =C2=A7 3.2 Streaming I/O:

> A driver can support many sets of buffers. Each set is identified by a un=
ique buffer type value. The sets are independent and each set can hold a di=
fferent type of data. To access different sets at the same time different f=
ile descriptors must be used. [footnote]One could use one file descriptor a=
nd set the buffer type field accordingly when calling ioctl VIDIOC_QBUF, VI=
DIOC_DQBUF etc., but it makes the select() function ambiguous. We also like=
 the clean approach of one file descriptor per logical stream...[/footnote]

This latter quote reads as though it should be possible to open() a
node twice (i.e. two file handles) to access the different buffer
types, e.g. V4L2_BUF_TYPE_VIDEO_CAPTURE and then
V4L2_BUF_TYPE_VIDEO_OUTPUT, but this is not compliant - see e.g. the
tests in v4l2-compliance.cpp within v4l-utils:

if (dcaps & input_caps)
fail_on_test(dcaps & output_caps);

1. Is =C2=A7 3.2 actually meant to say "To access different sets at the
same time different _device nodes_ must be used."? Or could it state
something like "To access different sets available to a node,
different file descriptors must be used". Mind you, I can't think of a
situation where concurrent access to different buffer-types makes
sense (but I am a newbie).
2. Could (or should) =C2=A7 1.1.3 be more explicit that "function" is a
combination of input vs output, and medium (e.g. video, radio, audio)?

Kind regards,
-Stephen

