Return-Path: <linux-media+bounces-38518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3EB13365
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 05:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 865957A9782
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 03:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910AB1F3BA4;
	Mon, 28 Jul 2025 03:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCzyKZG5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE77DDAD
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 03:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753672986; cv=none; b=B5mgt0UvKS7I2vz5ffeK33jZ2GBbcuIWVZtSfO8eA7avioBEXKbOzBvujtAmH5AMiubgtKrQkytVxmhqLU/hAo2vVWQIEVrm0VUUR35X+uo4V+DDM57Tc5vn1evHUL5ps9O/9AFdG9m+9Hd4ZA7vQgPIsD4UcRJ5wIxPuCXLerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753672986; c=relaxed/simple;
	bh=1veh3pMKZ49blEsxNC+fP2ShPTqo2ORaHWDdvU6qZhI=;
	h=From:Content-Type:Mime-Version:Date:Subject:Message-Id:To; b=OJbgISysy97QyrdUpgMGALObdK6lNp4vXY06uWXODLbuVLH36+bRZ6cRnTDXpu1cisz6x54HI14aYSu6C9h0qGRU9lY8GYtP6hgPRsetusQc+Hvnt3+ljwn9U2y5Am87AVPLrKIEN0zUCTvSPAz9QPx2/wDqR0Mky6rqdApvmZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCzyKZG5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so4924000a12.0
        for <linux-media@vger.kernel.org>; Sun, 27 Jul 2025 20:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753672983; x=1754277783; darn=vger.kernel.org;
        h=to:message-id:subject:date:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xj6gcHn4FWqqf5bggbS4Hh6lfBBKUH6us+53QzEZYb8=;
        b=HCzyKZG5krLmCzl2zjGqZAAvArEfeek5/XhpGu5cc6UHHu+t0QPswd4ABqRGfX94Bm
         2g0AjzpqInSDoNWODJZUDi5L0soQpgnXy7uZvK6FjcLe1gjJr0MgoOakcQKpyztykaQY
         F2n8Qk2QuUVrjkfjysA/UMDVRs0/7kWZ86zqxUbJA/8wnqSvuqn+fN2+YCf0pzpqjtGL
         wd6EfXWwh9c5DuzsgocNKrzIPna/WmUk5PhRDtupcN6jZuaN4alOty778WpdD63v+QM/
         HyvzPYScfpLu9cfu4DlTrFuHUl9BvS1SgZ3fSfnQ3lgFAEG6oasoH5gVUS0BTKxAnJyF
         aV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753672983; x=1754277783;
        h=to:message-id:subject:date:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xj6gcHn4FWqqf5bggbS4Hh6lfBBKUH6us+53QzEZYb8=;
        b=mdZYaGmEVH+qOD8NBE2cS/CEtXqTPdpOYi4rP49yswWbwyBmZ1zMs4V1FYC0zxZ7ZL
         CJ3VzwzyAai5/4s3v04kq2JNxjNGrtPWL1sLh008PqHRg7lLiw9rgsp1O/Bewe6VVzjA
         q+sIhZqzkuX1cpvrV5c1a0agy79Dlgfy7WOYRwUaF7xADPxzZdjyqhTfELYyKyjKnpTF
         +/+PL6s//k8G9Mh+MpYEE1dpVQr05P7t70jfkjochIryBVsOh1A/8OhpkFCcNUpB5zve
         L6YLWkwV1X1BCq+YaprN227OF7/KbBK2sYAk+isVcbv61yACQpz3uZWJAiyIQS5+5FyE
         zOGA==
X-Gm-Message-State: AOJu0YxCeCiORosnwISa+DrNKjUt80CFAQ0nriH7bGPxcOJrECGtpfZr
	JBmfBq6rF7AHmid2Bk21dWBw2qWSb+wSoRI9HzvVl+E3DDl02dAqG7VXA1cpKg==
X-Gm-Gg: ASbGncs5c8JGTNz8zl9oSuxnqB+Kov/69m5/rPpcWNj0D/rNERTHxBOn/Rk/tQnRgEN
	rsaOuh4MCTLkGFpK6rMLrcA/5rLoGMgSubSmQL/PU1qWIcSQRQLvacwiEHmFjZmBnxmLUSpW++e
	HffZREyZ1cYZjqwhw8k+80+ltRkSW62hLdZqJ4BNWUJ/WIREdAdtcZ3haK+wBENHIgmC6Byore0
	5LZNb5PX78nQw0iQ0Sh83PUlk5IjS9bGj5StC1EAiMK8ssCfhR53l4C0HzLPHytsfhWEi26OBXH
	vemWRZ2EFubC5PIO1Ix1YyE5qY2urY1TuZY0b9NKH0OELo8R8shVLM8VbeeMpkdWBUvcUyiZD9b
	u5KFc3v+tsaw1z8kO8A2WCClhMjxmCQrp431U3B817SZC+sBlcz1FpY28Xq7QwjxgkdS07chYZj
	FKhnHesP/VF9r57W/tNDZMzYSCR90H
X-Google-Smtp-Source: AGHT+IEmd8NKGBBcfCZa+S9xHNhrG3Umwn1lkAAIc939/0TT5S5oUNuueDtpDeVDxenXffqtsoVXZA==
X-Received: by 2002:a05:6a20:a10e:b0:21f:4f34:6b1 with SMTP id adf61e73a8af0-23d70014f76mr17460101637.14.1753672983404;
        Sun, 27 Jul 2025 20:23:03 -0700 (PDT)
Received: from smtpclient.apple (h24-54-183-114.hbbsnm.broadband.dynamic.tds.net. [24.54.183.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b8b0911sm4000887b3a.124.2025.07.27.20.23.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 20:23:03 -0700 (PDT)
From: AngryTurkeyStudios <angryturkeystudios@gmail.com>
X-Google-Original-From: AngryTurkeyStudios <AngryTurkeyStudios@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Sun, 27 Jul 2025 21:22:51 -0600
Subject: Bug report for v4l2-ctl
Message-Id: <CA68C31F-B0B6-4156-A084-6AEB8338AA88@gmail.com>
To: linux-media@vger.kernel.org
X-Mailer: iPhone Mail (22B91)

I=E2=80=99m fling a report that a trackpad interface is reported on the list=
 of video devices when running v4l2-ctl --list-devices, specifically what I b=
elieve to be the trackpad on my Alienware 15 r4
This is what i get

Synaptics RMI4 Touch Sensor (rmi4:rmi4-00.fn54):
    /dev/v4l-touch0

It also takes priority over other video devices in some applications.=20

I=E2=80=99m not sure if this is more of a linux system issue or if it=E2=80=99=
s intended to be added as a =E2=80=9Ccontrol interface=E2=80=9D.=20

However the issue I=E2=80=99m having if it is intended to be on the list is t=
hat there doesn=E2=80=99t seem to be a way to specify a list of only devices=
 that have a /dev/video[0-9]+ when getting a list of devices.=20

Hope this helps,

- Natalie=

