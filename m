Return-Path: <linux-media+bounces-20210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B809AE9D8
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 17:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AEC82816BB
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 15:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516C81E7C35;
	Thu, 24 Oct 2024 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3edZvAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E243C1E378A
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729782535; cv=none; b=ab313TWGgcRKuDf8MT5A7/XNJyWyzrtl1rDapghEte7BUvX1ui6PFsZnp6aZGzFndre620y6rtpboYuf+oDN4PkonRfNxgt4vHgnxzrP+PPYXLZ3Qc2k3auFJgH5UVDnMipz4xPcgrWHsdulNa9unejC3hqGZz3A1vckx55d5Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729782535; c=relaxed/simple;
	bh=ctqp8yrQXTrpTpfvJnx2lFy4SGQMSHdCStmuJBFN5oI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=n3dwWYNM3PEc3cDyFaQlxHIvUOKed6feYd+ETKFAnc+2YJkMySaiV0EP+RLu5qrR7jQwe98xZ/gAG/sJQnR9iYfTmxZq4/zBJTmm1a97dQFptynv1fYMZ3LwHu7yKrERsiklKb56PV0SyPDrQFIGdCA53NgqoVqxc2+0nQd8IWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3edZvAJ; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cbd57cc35bso17661546d6.1
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729782532; x=1730387332; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ctqp8yrQXTrpTpfvJnx2lFy4SGQMSHdCStmuJBFN5oI=;
        b=L3edZvAJcdLq8rhqog2Exl5mHSmRC8UQ4ZCNXk5J9OINsjDaTbtxGBrqLdCCiL7i0t
         k/OaFW7hca6leQ51+jmCzQPqPbuPwWpIeqXzcyOZy6PrLQerXXPWXmTMxqGztgxVsBR7
         92kHooRXEIdw3cNZLjw7jZQe9fYBHpowbxGHSKjWToqVg3+ClHI7Hef5u10XlJfhxfnm
         DWYqODKUfwlM/gfEiBLgO3Pyb/ATLtOZWuW2QGs4JvOUeqDqkcApGlNhP3c7irOZZxCl
         9TwIbTQpSFQXCCxVLPiH991wyeKisMLyyKksMc2dLZ6fNzRL2ilXJzkS7MB9XgmNY6XN
         43TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729782532; x=1730387332;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctqp8yrQXTrpTpfvJnx2lFy4SGQMSHdCStmuJBFN5oI=;
        b=xTwbY9BiPDhh9HMWH0pGIfNDRhKG3Y7vdmCP4jjN/SeXMYwnCTmORa5oGuFL4rGlHa
         7/toBm46UoG+/OTNJudBEcCSCJTeOguuwgmbzLUkGDixvvp49elTelxB0UOCtWubg+cG
         aaVwVfKcN+S3nMW2BChfUuc/R3deWyS12yBpOFqeyjQMWtm6kbuISWjKQp/JtRLc1rdv
         MIGzxcgILuNt823g4zqmJdy74MAxO+MynBpDHNuYx/Floh9Z8m2qyFtnh+goXqQNE1cC
         MANMmbJNVLH8N8U1sEBgYEp2vJwMtCfWlQYyXwleotF9SlZnKQGWCkP55UPFUV9Vhvfp
         PPGA==
X-Gm-Message-State: AOJu0YzaGBaGDS4r245ASfLH9iecKuZYj1o7uagDKe8Wz3Ss151PGGdV
	FLefdFtfqQ76f1btx1UmPfxDLcC0IL4JrZezC9EbA2uLhGihKNLSzM0RPQsOhI/2k28UojUjqlU
	ezr/0ytaaQow/ATanPNxvZXUDiTstAQ==
X-Google-Smtp-Source: AGHT+IEmjNdb94wkbnP4tYlqg3bz6bvKvIchMbDW8jBHQxmqrbYXrAmzF99RW2IbqohBpyJVIMRfeC/qSMwhLOzpoT0=
X-Received: by 2002:a05:6214:400f:b0:6cb:ee9c:7045 with SMTP id
 6a1803df08f44-6d0763a1ff3mr38175216d6.2.1729782532377; Thu, 24 Oct 2024
 08:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jeroen Venneman <jeroen.c.j.m.venneman@gmail.com>
Date: Thu, 24 Oct 2024 17:08:41 +0200
Message-ID: <CABKG=O6=cGgcCcq2WuMcCX2GPzK+J1u7Z3K85XdrbhCiogE4vQ@mail.gmail.com>
Subject: New DVB-C scanlist for the Netherlands, providers Trined and Kabeltex
To: linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006210ef06253a61af"

--0000000000006210ef06253a61af
Content-Type: text/plain; charset="UTF-8"

Hello Team,

Attached you will find a new scanlist for the providers Trined and
Kabeltex in the Netherlands.
I sent this also the 9th of october but have not seen any response yet.
Could you please add this to the current scantables so it can be used
by anyone interested?
Thanks in advance.

Beste regards,

Jeroen Venneman

--0000000000006210ef06253a61af
Content-Type: application/octet-stream; name=nl-trined_v5
Content-Disposition: attachment; filename=nl-trined_v5
Content-Transfer-Encoding: base64
Content-ID: <f_m2nft4pb0>
X-Attachment-Id: f_m2nft4pb0

IyBUUklORUQgLyBLQUJFTFRFWCwgc2V2ZXJhbCByZWdpb25zIGFuZCBpc2xlIG9mIFRleGVsLCBO
ZXRoZXJsYW5kcwojIGZyZXEgc3IgZmVjIG1vZApbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9
IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMjQwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUw
MDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBB
VVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZ
ID0gMjQ4MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1P
RFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZ
X1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMjU2MDAwMDAwCglTWU1CT0xfUkFU
RSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZF
UlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJ
RlJFUVVFTkNZID0gMjY0MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9
IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0K
CURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMjcyMDAwMDAwCglT
WU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0v
MjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMv
QU5ORVhfQQoJRlJFUVVFTkNZID0gMjgwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlO
TkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpb
Q0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMjg4
MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJ
T04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RF
TSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMjk2MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4
NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04g
PSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVF
TkNZID0gMzA0MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUK
CU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElW
RVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMzEyMDAwMDAwCglTWU1CT0xf
UkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJ
TlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhf
QQoJRlJFUVVFTkNZID0gMzIwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZF
QyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5F
TF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMzI4MDAwMDAw
CglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBR
QU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERW
QkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMzM2MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAK
CUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRP
CgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0g
MzQ0MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVM
QVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZ
U1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMzUyMDAwOTk5CglTWU1CT0xfUkFURSA9
IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJ
T04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJF
UVVFTkNZID0gMzYwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5P
TkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURF
TElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMzY4MDAwMDAwCglTWU1C
T0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2
CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5O
RVhfQQoJRlJFUVVFTkNZID0gMzc2MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVS
X0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hB
Tk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMzg0MDAw
MDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04g
PSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9
IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gMzkyMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUw
MDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBB
VVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZ
ID0gNDAwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1P
RFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZ
X1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNDA4MDAwMDAwCglTWU1CT0xfUkFU
RSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZF
UlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJ
RlJFUVVFTkNZID0gNDE2MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9
IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0K
CURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNDI0MDAwMDAwCglT
WU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0v
MjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMv
QU5ORVhfQQoJRlJFUVVFTkNZID0gNDMyMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlO
TkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpb
Q0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNDQw
MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJ
T04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RF
TSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNDQ4MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4
NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04g
PSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVF
TkNZID0gNDU2MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUK
CU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElW
RVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNDY0MDAwMDAwCglTWU1CT0xf
UkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJ
TlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhf
QQoJRlJFUVVFTkNZID0gNDcyMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZF
QyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5F
TF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNDgwMDAwMDAw
CglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBR
QU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERW
QkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNDg4MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAK
CUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRP
CgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0g
NDk2MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVM
QVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZ
U1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNTA0MDAwMDAwCglTWU1CT0xfUkFURSA9
IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJ
T04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJF
UVVFTkNZID0gNTEyMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5P
TkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURF
TElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNTIwMDAwMDAwCglTWU1C
T0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2
CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5O
RVhfQQoJRlJFUVVFTkNZID0gNTI4MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVS
X0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hB
Tk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNTM2MDAw
MDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04g
PSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9
IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNTQ0MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUw
MDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBB
VVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZ
ID0gNTUyMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1P
RFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZ
X1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNTYwMDAwMDAwCglTWU1CT0xfUkFU
RSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZF
UlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJ
RlJFUVVFTkNZID0gNTY4MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9
IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0K
CURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNTc2MDAwMDAwCglT
WU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0v
MjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMv
QU5ORVhfQQoJRlJFUVVFTkNZID0gNTg0MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlO
TkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpb
Q0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNTky
MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJ
T04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RF
TSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNjAwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4
NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04g
PSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVF
TkNZID0gNjA4MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUK
CU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElW
RVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNjE2MDAwMDAwCglTWU1CT0xf
UkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJ
TlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhf
QQoJRlJFUVVFTkNZID0gNjI0MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZF
QyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5F
TF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNjMyMDAwMDAw
CglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBR
QU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERW
QkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNjQwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAK
CUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRP
CgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0g
NjQ4MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVM
QVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZ
U1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNjU2MDAwMDAwCglTWU1CT0xfUkFURSA9
IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJ
T04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJF
UVVFTkNZID0gNjY0MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5P
TkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURF
TElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNjcyMDAwMDAwCglTWU1C
T0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2
CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5O
RVhfQQoJRlJFUVVFTkNZID0gNjgwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVS
X0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hB
Tk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNjg4MDAw
MDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04g
PSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9
IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNjk2MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUw
MDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBB
VVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZ
ID0gNzA0MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1P
RFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZ
X1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNzEyMDAwMDAwCglTWU1CT0xfUkFU
RSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZF
UlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJ
RlJFUVVFTkNZID0gNzIwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9
IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0K
CURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNzI4MDAwMDAwCglT
WU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0v
MjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMv
QU5ORVhfQQoJRlJFUVVFTkNZID0gNzM2MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlO
TkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpb
Q0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNzQ0
MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJ
T04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RF
TSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNzUyMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4
NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04g
PSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVF
TkNZID0gNzYwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUK
CU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElW
RVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNzY4MDAwMDAwCglTWU1CT0xf
UkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJ
TlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhf
QQoJRlJFUVVFTkNZID0gNzc2MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZF
QyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5F
TF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNzg0MDAwMDAw
CglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBR
QU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERW
QkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gNzkyMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAK
CUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRP
CgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0g
ODAwMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVM
QVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZ
U1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gODA4MDAwMDAwCglTWU1CT0xfUkFURSA9
IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJ
T04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJF
UVVFTkNZID0gODE2MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5P
TkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURF
TElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gODI0MDAwMDAwCglTWU1C
T0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2
CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5O
RVhfQQoJRlJFUVVFTkNZID0gODMyMDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVS
X0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hB
Tk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gODQwMDAw
MDAwCglTWU1CT0xfUkFURSA9IDY4NzUwMDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04g
PSBRQU0vMjU2CglJTlZFUlNJT04gPSBBVVRPCgpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9
IERWQkMvQU5ORVhfQQoJRlJFUVVFTkNZID0gODQ4MDAwMDAwCglTWU1CT0xfUkFURSA9IDY4NzUw
MDAKCUlOTkVSX0ZFQyA9IE5PTkUKCU1PRFVMQVRJT04gPSBRQU0vMjU2CglJTlZFUlNJT04gPSBB
VVRPCgo=
--0000000000006210ef06253a61af--

