Return-Path: <linux-media+bounces-32198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A46AB216F
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 08:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D28B77B8E4D
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 06:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CE01DED5C;
	Sat, 10 May 2025 06:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b="FiTb/G3i"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CF52A1BB
	for <linux-media@vger.kernel.org>; Sat, 10 May 2025 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746857416; cv=none; b=qaNdFtJrvQLQbDOEkMCD9N+THcn/+mvkzcS78bTJzmUar800x0gMudXsRONNFeyPH0UCqdzTVz5XI3a6THtmkMhY2YD6kqBAs7LLJe459R4y+/Fp8bph0nsog0M8y43B0jT5/iaeVroOTLVLg5/PDYy84heDKwQMBLTmCOdQ6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746857416; c=relaxed/simple;
	bh=9Q+UITbf23yKteSsREz7EE2271fctX1Kz252Zoy7vyA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=TvvFUe6fimlFFAKJEdC7VGozrmBD4Grjvtab9bY59nMP/xieKqTnYmpKsFsQEzhuMCupocmKB4v2NyLihE3cPDuRidIYlmWuEm1M6Q5kDLLXJWMI1+Mcye+wSibkAk59hcoH8OCWNBtWust8+0zTNq4dDJFUtPOkLsr95wV2rwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b=FiTb/G3i; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1746857411; x=1747462211; i=yarny@public-files.de;
	bh=9Q+UITbf23yKteSsREz7EE2271fctX1Kz252Zoy7vyA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FiTb/G3ix2VsTiOLbZ88VV3P8qjKQn224tFUbQe/pr9rlONHJXjTmFlPfOzVw0Ws
	 2Ju4Gzk54UV7nPgTr+A641ERIYy2ZbiFknBpmpPp4siduuQ32SUVsaGxEYi+rb/Hk
	 f0H5KvqWTBd1/VqtA1uyyCiLc2BDEtTz5SeKvRr26rR2LwB+NB0UFsSTZTlHJzVKb
	 IMAUyHC7XtS9wcdUabjmU2K7MCB/ZvA4MuNxW6RjtdTbFXVAPUCuOtrPQYThooSrM
	 E1XBU0JUQGAOhxRTg5EMp5A+kmpLIaQLlOh7PERRK6rYoGeW0hNseU1MoyZcLMJKf
	 CR8gpxaPpXAK8XV9iw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([146.52.47.213]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6lpG-1u5OLl1i62-00F6yz; Sat, 10
 May 2025 08:10:11 +0200
Message-ID: <beb0d280-bf50-404e-884b-ac20df87b5ed@public-files.de>
Date: Sat, 10 May 2025 06:10:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: de-DE, en-US
From: Yarny <Yarny@public-files.de>
Subject: Is dtv-scan-tables still maintained?
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:uoXGm5A47e035yjJPVEyDnebYfgC+RRoqbZkKupZ7M/bPAPxsJq
 BaC97lO68nLdH5Tn1dUtmPEpwLig36oiOo0h1HZmtS2RmI0p4DfoOXk/1bL79tNF426sRU9
 aZqvh1w7f8aEXAVaRinFchLi57/C726TdOb/uVw2AExkPzewQb0RG1Yn+CX6rWTohNlJxe9
 slznz++m0lFvuDTFEdpKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jb3L2wFKa+U=;QLD2WAg86XTEzF+HGtTabHfd4i3
 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
 Q==

Hi linux-media,

is the dtv-scan-tables repository

> https://git.linuxtv.org/dtv-scan-tables.git

still maintained and updated?

Several updates have been sent to this mailing list, like

> https://lore.kernel.org/linux-media/846e7968-292d-5e96-b2a4-1e2e6b131fe3@tutr.cz/

and by myself

> https://lore.kernel.org/linux-media/6d8986ff-7df2-4ccb-b68e-088005d38f92@public-files.de/

but none have been acted upon so far.
The most recent commit is more than a year old.
Nevertheless,

> https://www.linuxtv.org/wiki/index.php/Dtv-scan-tables

and

> https://git.linuxtv.org/dtv-scan-tables.git/about/

explicitly ask for patches to be sent to this mailing list.

Thanks and best regards -- Yarny

