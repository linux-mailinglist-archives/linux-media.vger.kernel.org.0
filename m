Return-Path: <linux-media+bounces-24857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B80A1445F
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 23:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51E9A188E02E
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 22:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC6D1DDC0F;
	Thu, 16 Jan 2025 22:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="cP5do12o"
X-Original-To: linux-media@vger.kernel.org
Received: from mr85p00im-ztdg06011901.me.com (mr85p00im-ztdg06011901.me.com [17.58.23.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C263214901B
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737065429; cv=none; b=P5PriYf4nJwvnbDucBCNBw/IMv55C99TNx5gfn4q112lKnTw31SwhTJFqbNurrRYDpl54qBvrJasYiiFiHvj5ZwlNJew8LTw19T5cyVUe8NeFuWFWm97834XaDEeq7NuVm1ldvnStKC4fAp/C2uA/u+RlOwux3ffFg+bY/6/vYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737065429; c=relaxed/simple;
	bh=ruW4UFXxVsMKbdPMnmxDaTv+16pA7U93ISteQk0ZEwg=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type; b=OI/BjBby3Qg1e2jVAAvzlIxZfA4mWRdp9KsA0Jm6Kojpv8lBtbDd1xHi5Fu/pWrPDHP+1tfOdJ9a3X2Mt/293U4h0Bwm3izCbCgFfqieLrEneWydbNzpy6lz7wYle/L55fKC/MIBL2RjvqYciLZV60cu99VU8KixDbPU9IeuqVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=cP5do12o; arc=none smtp.client-ip=17.58.23.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1737065427;
	bh=ruW4UFXxVsMKbdPMnmxDaTv+16pA7U93ISteQk0ZEwg=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type:x-icloud-hme;
	b=cP5do12o/pj/HupYGjAIP4w5gfyobDGJOW/0dgde1QByCDKXPgQtybxMZGvxo++6W
	 QcNZF8uZQo52/MKT4Y3975Rl6jDd8NE2ez+f7wSyib98pIWphStcpgtdwukRSw7udI
	 OJu1qM0L+PtxxkiLIs4H4IlIyii5tAh1Ih8PPy6Vf1NFfcKQB9MjvaVFFArSJopJVd
	 2SFIoqNKlS7JwWkDfdWRZpUpNF/wtNia16NIhs+mlkwG+m/fF46h70qcBLZKd7Vs1F
	 LhY0v2qPmH2Z8/Qotsv+ly2B9HfNCt/g+0hXXJimq5h143GAsavcSBHh4U86/I8eSo
	 rmECdlL0dLPjQ==
Received: from [10.1.1.110] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011901.me.com (Postfix) with ESMTPSA id 4BAB51349C58
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 22:10:26 +0000 (UTC)
Message-ID: <b6d73787-a114-492d-83e4-b73a9ae1459a@icloud.com>
Date: Fri, 17 Jan 2025 09:10:13 +1100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
From: David Arnold <david.c.arnold@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Nju-CiaTRIa-EBIX3sfDmmEp1ZIKRDuP
X-Proofpoint-GUID: Nju-CiaTRIa-EBIX3sfDmmEp1ZIKRDuP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=354 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2501160164

help

