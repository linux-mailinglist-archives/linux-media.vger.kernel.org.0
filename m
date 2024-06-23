Return-Path: <linux-media+bounces-13979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEC1913997
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 12:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 103061F21E19
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 10:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B13884DEA;
	Sun, 23 Jun 2024 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="DU7kWsFB"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9787B9454
	for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 10:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719138970; cv=none; b=LJ+S0Ngwns4W4jVWLyQu5JWUvlTRC1PNVRz9sSlsuUEk+PMYiOOb0+SLzeddXppw+Bb6BFFe/4jNEXRbm2gc1xC0eS3U4BgGkFPT/hro89zfbB2LPkpKmaiKmQdMsTacMxjAc2XjzxkgEOAPd6jF9++5gomCkCvLkFAWtE683oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719138970; c=relaxed/simple;
	bh=vUR9jPvn++2k9v+fbVMgEABN+5aSSFGB+cxmw841cpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cib9O1nmcX2fLTnmfek0tSLcQ/R6biEvJdit4J5Biqp8pjhOFni5u7vBLmF++eNWRElqYMaVog323YIrksHT2xp8US6E9IjNT9r0vaVxFfeo/m1kLXPGQtoeoHcgfDe0tMIlfLYOHJ0aSonGAR0AihMgx7YQZkYRfwwZcQkeBlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=DU7kWsFB; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719138958; x=1719743758; i=nils.rothaug@gmx.de;
	bh=vUR9jPvn++2k9v+fbVMgEABN+5aSSFGB+cxmw841cpU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DU7kWsFBOQvrFSVc5pCXEX09tHdTMHqChWBd4+bHnQViN+YzZERMGHy/wRCjo7ra
	 MuyNYMQ92oRc7JP6pQfoF1vsKqfNmKeaOikytbuD5GtVyRXy4NhtlvESrLKoSWtZV
	 Amu9gZKwDafM/GBGXWeSJoOvFaqrf/pTIY57PCRrfELbd5HmQ/F/9D12ImQUww08c
	 WzVxOFP8GNhHQKkY33z7oSPNTLB+gutX3JZwJpBs//XoqlV3e8CLpGBaiJkMKNDlp
	 doxK23+6MSmiyEiQfsF1Rd/lQnmcluLO5kwEmvFwHuDyAysaiK72w45WGBi5oHTW+
	 c+wapyz3wYRB97YIxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MFsUp-1s8Lkv0OOF-000TMY; Sun, 23
 Jun 2024 12:35:58 +0200
From: Nils Rothaug <nils.rothaug@gmx.de>
To: hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	nils.rothaug@gmx.de
Subject: Re: Re: [PATCH 1/4] media: tuner-simple: Add support for Tena TNF931D-DFDR1
Date: Sun, 23 Jun 2024 12:35:50 +0200
Message-Id: <20240623103550.7593-1-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1c446b8f-8b82-446d-ad19-9bf8625a1b71@xs4all.nl>
References: <1c446b8f-8b82-446d-ad19-9bf8625a1b71@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rLzSKB0MSRByDTnU/Jm/FRsIokUKtLA/xPEameUvb9Zxwg3o3Yf
 lT4+cQHjATfTbDv9+tBAUKlnCs//wuUZG6e0iA85II8NxpwABlwtYLCGh0H5bjXf7+9kJAG
 v0+sa4MNr/FhrBqIpnp6OHK1AYvFTGuZ8pVO22mhyeh1w3gUXsqNkx3ycARjoonLxh2UVZx
 gqpwpLh6eH/8ULlk67PAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XmVp7grHAMM=;d0lkg/TTrI4qsA8UL3ur1NvjLVX
 dYlOumjPn24yX0WrqGKutAt+ucJsuUIaUwKphwD2FyNwX4R3sMSsFNWsptmxTLeqNats0MkT3
 Cvvb92Dl2C/4y+6mkCnFj+mHILExKrBfpoTKL4337S3a3vySgbiBux4Bi9kGuDhmZ5uWOpcV+
 Y7zEDiA2SlpPFZBZoFVTqLqq3ujLuEd/0883vJMZyoGaBE4qvdcSCnlyuRIeL/OtaLIMSehKp
 /O4wVmkAmnf+E4P5Rv4FtqZbSVwYf0Z40f/U0hCJaEYeGwtMHTKob87RVquNn0xhs49Qz6vcL
 ka1GvyBHxmny8kc8U6M8kYjG4hX1oJuF7IXbYHWlOeQETbZ3caWNZcAZrTl6+DocrgCsGMncY
 I+XBzBAVw/V2GA5qmoBAc8Jy6sSV1EcM81l/QG3zuMpDPbUPzBM7hH9043HjCZpR5GOtvoMP2
 8U4Wr1KdFFrTs9rDwO71VZ+oDHpCoYuWFXmx0qkKCF7LJipIE9kjY0SBtBGm6eFvk5sQwYbmG
 BsWoujAcPXqKmQXUk7pUpHGzntcLyM4ZNyf0vApUtlvt8ER2sOwslAwSoEPBcZ2FBlo0pG/03
 g25VimdJC6N7q8svzgxmOxTpH9xRWLcCk/bu9E1kJdRJtjYz1WD8Ow+kbxenk6lqxpX0Bz6rn
 AR6gH1/iwmdUfLQCnb/sHs3VHk2Xt3B5BL1+VfmzjA0IRzo3Gq0aZTxJbss3V5ZHfA8z9rR4K
 2hfNGTbgHK92TsDaoSK3eBcyKcnr2GFD4PfWmpZy8i9KsRzOvAeCJI7kWA9H3tBpU8qb/MpJU
 ncrGCoCsKeN8vOs4Nij1q58cMSP4WT9dHmGp9Wk3g3uIc=

On Fri, 7 Jun 2024 12:08:46 +0200
Hans Verkuil <hverkuil@xs4all.nl> wrote:
> Hi Nils,
>
> First of all, apologies for the delay in reviewing. I'm afraid that chan=
ges
> to old USB drivers are low on the priority list.
>
> The good news is that the code looks good except for some minor issues.
> However, how it is split up into patches needs to be reorganized a bit.

Hi Hans,

thanks for still reviewing it anyway. Patch version 2 follows.

Best regards,
Nils

