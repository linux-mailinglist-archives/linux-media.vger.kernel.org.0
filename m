Return-Path: <linux-media+bounces-47601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D5378C7BA75
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 21:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7E521352E32
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 20:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5DE2F069E;
	Fri, 21 Nov 2025 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjLmXg+s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003D32D063C
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 20:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757267; cv=none; b=KwXOnCQQVG9FtYT9oYyvU+Zaby7bDEyJn+s+7JquQaBg0WQovDqr6Yel3pCOdpXGqRI+Wfoa7a6yMKIsyx4LkuNXosVgIqV4w1OnmDJu2O862sxbWM1u+Qc045k/qS2owY3+h2gc+PxyeyA8GxUb7S49HCuktiUgc5iK9QIKGFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757267; c=relaxed/simple;
	bh=ZpxaBI0Ip1VOlKuG9Yzs1OvVOzUa6LgmbfBUiO/zX24=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=U1Rx57xtyu4ImnFOjvDkqdFJFqMvWTamo8IqBrPet00Jjx3YGJk9wUn3kHhPgzIE/5gg+/luf6qPmZxuLErnIGfLaCgyedbWT7eU55sm3LEVnR3xksCURAvCRsXElfEik06kw2JKGMZLzqP3lrQfq/ofs4dAmJcPYwiYC67/pO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjLmXg+s; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c6da5e3353so1633351a34.3
        for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 12:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763757265; x=1764362065; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZpxaBI0Ip1VOlKuG9Yzs1OvVOzUa6LgmbfBUiO/zX24=;
        b=JjLmXg+swJtmaU8yjYcRSoY7SS7DNAU3VmQxUhThJwI6aIJadIA3yIR2E1kz1pFsEF
         r1p7IDMY7vdkdxeH1Su1O2Wa+3PDeMt8Qc+2eC4z5zruY7TchLf5JY1jZpif7Jk4aBb9
         PadpEB/qB62uYsu7OdaVI5fumHPsoX6ONy7lKDiAbpeAEaiACfyaE/cYulCN/T4228tF
         GqERkwjgFiiaX7unBUtpwNJMTOaeIUL15enRBtbs+cHPDtD9k3DoNWUSuJPwTpdYL0jw
         b/bYT5QTr1HnPzZr+RnwB1jOSYUSn/b2VRWH+fbVar3kSuknZBtzfht+7yfZI4te/rYe
         hbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763757265; x=1764362065;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpxaBI0Ip1VOlKuG9Yzs1OvVOzUa6LgmbfBUiO/zX24=;
        b=NJ5oo2s3RSgz65O5aj95sY+g/FDic7osrHXOuEC/otoBpzu6O/x6jbq5RAbhXlUb3m
         ZWNwH1cfp5RX5dIj+8SY8B3eN9jX2dUewtBN0MtMFTDYfsPm3eJ+WgjwdQzq6Rgkn8EV
         Wd4hsVI0+21BTkDAs2F6UFBtEKamm1NmsD56jFJ+l4HjVjJgAYuZCzJMuDy+zJ5xTNLR
         3Nxi8FkhASfoOT5tN5sPxlncP6tG4hzK18/8v6Lp7Ms994w9xnzvE7TkUikAfq1nlKk/
         vpM17I6XI3QT+ns4Hx11z6y06fFRLavGwl18LaCsIsyIM/iJaUDefMjtOS6mbiJbQ6Dy
         35VQ==
X-Gm-Message-State: AOJu0YwDLjN37fqniLRjxv7GA8dvjKc6yQOQYChCNNdEF1NGVQfRPkuZ
	SgWxMVKFo/CsOjuGkNafwvu3x16fPlucFnE/PicRakvNDev+wywHhi5+wzdJbB6SC0/Vee/xWSK
	MTQTEZl9cjIOiJI6w3aK3MgYt38tz33St4qsxNdY=
X-Gm-Gg: ASbGncsQO51cD0GSxGGfem/Qv1TLAigwf+gntsuAxmeYOw6mn/NsH2UUZRNRiUUoOox
	uYpJ0J+GD3kfvNk0xTLAef02QpBo1CztgwMLl1QVMuAkl1HT8QD1dNhCRS+RnZ7RR3pmaatr0dk
	1TwxH0RDgIhskL+b/xToIg45eACiDdu5t3ZxKZ3mlZ61JzojyWpJGmmuymxjZNBTl+R78uQvrDC
	O2xjPkMcSnPMlq0YvlkOL7cIcEqaYyjFl9vr6BnnC3e/9/QAfUURp52ZfPke7SP/K21wnA=
X-Google-Smtp-Source: AGHT+IGoRHjplYoQWp8cx5FX0/YFHwn3O5FVstl1QvgGaGTs81cgJWapP7C2NSwCLpjTks+NSlNppVra0RL5VLB/Nt8=
X-Received: by 2002:a05:6830:6dda:b0:7c7:5f09:879c with SMTP id
 46e09a7af769-7c798ce4fd3mr1591209a34.26.1763757264877; Fri, 21 Nov 2025
 12:34:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sune Brian <briansune@gmail.com>
Date: Sat, 22 Nov 2025 04:34:13 +0800
X-Gm-Features: AWmQ_bmoeZ5k1vD9VZSR4iCSNapy-gb53eu4el1JBrwzJUdmRuUCbYLnkcluIAM
Message-ID: <CAN7C2SA34JN71qvqyefmr9h11SsmCaeGGVyc=GW408+MrC-aRg@mail.gmail.com>
Subject: [HELP] V4L2 kept reporting CROPCAP fail
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear v4l mailing members,

This is Brian trying to seek help on the following issue.

* Platform using: Nanopi-Neo4 (RK3399)
* Kernel version: 6.12 & 6.18
* Issue: CROPCAP fail warming and possible stall on v4l2

More information:

The MIPI camera is functioning on both 6.12&6.18.
However, no matter preview or capturing there is
a warming message kept reports and cannot found
possible root cause.

Message as follows:
v4l2 gstv4l2object.c:5032:gst_v4l2_object_get_crop_rect:<v4l2src0:src>
VIDIOC_CROPCAP failed

Thank you,
Brian

