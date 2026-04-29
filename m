Return-Path: <linux-media+bounces-59902-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MObpGApc8WlVgQEAu9opvQ
	(envelope-from <linux-media+bounces-59902-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 03:16:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD60C48DEBB
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 03:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 721CF304A84E
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 01:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61297242D6A;
	Wed, 29 Apr 2026 01:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Zmk/UYoz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EB6140E5F;
	Wed, 29 Apr 2026 01:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777425401; cv=none; b=GeFGB4A/+jxcMDZlUXWssMBELAgiGmRBQcO533EDogPftAg1Z47pKjaxnnWinZEPT8RvYRWTnNK3H7G8s2gIA1MGZ8Z6ydVUlU4vqkYfTORwZatVYQN217kX9Np8qQSsv4DQTMntieQcdatY9SNUb04OjdhctzPRGLGLUF+UqDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777425401; c=relaxed/simple;
	bh=S+FNbfKs3zWzpba+7WwK68JDLp3UZ3kapy9H/lK6Gi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c6lWTEa9PoR5kia9kuTlogmFMmI0GcbanXMEqEFu3NcAlkYpakKS4ysmccRdsTwkJirT7Zwd1vduc4Pk7CsJCuoApH/MDltSVCJ9e5xa4WtTVDxWBDUIj0HHmCsVEbazUCLaO3CxzaGKzQ15Lwjk4SBLshf0vKTJJQ1acwuP0to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Zmk/UYoz; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777425378;
	bh=S+FNbfKs3zWzpba+7WwK68JDLp3UZ3kapy9H/lK6Gi4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Zmk/UYozO08t3ZIZGbxo0FBEr9SumSHwa3msNi966lVTPM8u7GX9hA0A0ClgetQsv
	 9qd25c90JCacxxVmC7eeC0s+zVPqdoHwc8unOdZmJ76ozAiq2W+I1LoDLvxuIMLFR+
	 QcTgKC1UCE085ESexo6tPey8sSPufzU4yB9i3BYo=
X-QQ-mid: zesmtpip3t1777425373td3ec577c
X-QQ-Originating-IP: GDJcawdk+BQ6NHO957GYWgpbBB1B8/YjOfUyxDCvAHA=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:16:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3897802648851776766
EX-QQ-RecipientCnt: 12
From: Haowen Tu <tuhaowen@uniontech.com>
To: laurent.pinchart@ideasonboard.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	rafael@kernel.org,
	lenb@kernel.org,
	pavel@kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: skip resume when writing hibernation image
Date: Wed, 29 Apr 2026 09:16:11 +0800
Message-Id: <20260429011611.1936498-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260428091356.GF3219146@killaraus.ideasonboard.com>
References: <20260428091356.GF3219146@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MAu4Ycv3XufaUcrR1qWL3rO+X/JSPnUZebdvPDfqXUIOU2fTSt2UAiFq
	81ZysyPu3MXfLKiHrPylIT2bl3Iq/vA3FtcsnlxThb7x5MuyrJR1dZQdud0fviS4FtZa8aO
	N2R6sEV8YdGWQJZ+T7mKny8V8HrIahvuqf8GweODIh3NK48qc+Y4TEV/dkfNCBhDUFIUYYD
	tcPRk0hxkox4Qu6efc+8RM8UElvCbXeNsS2s5LUr1YEgRDBZXN0aJ7xc6HPUFhQKJgho6T9
	S2Sv1sf58pG2cFUb1GV9P9hGLNqqxypNpQyoijMOF9x0Fqel9L7xA7OSIxcEfCh88w6QeO7
	3TRYF+4yqlUQc7zcxmQ0Nkof5pTd27Mojj6nNLnvGKizjfUX1OUUXWzPUMZ5IQwS8NohcdI
	u4RF/got+5nsqRea5YMv5qVJbZL8cwB7HRqBd4lczJonDekW1b0anlGr4dhPLsmNdufhdhT
	FMNku+z/UlYiaHeToBJe1ypUvht3P3Swahk+JlblvhPLhnmf7DY58psmxhHP0N9Dj9rew8m
	B/vSgjV9v+SQ419PoqCHWR15VLTx2Zzc4kMfzNt+Axa+vZjakp0cVXX/7Jw8gHwOU7hwrud
	yNnjoArAGYdZ4o8xcsKAfJDfwZle6nrIOAc2dg9Fl8/Yt0a+fkMykX4kjNt0HTJO//84YIS
	EKlBRJEdyMVKtuQSZnSt3u9iqMeyHBjZHMQKzAdzadVZrPXpW+p3fIDh2zJSmX8rd37pwUT
	0gd74h8Nx3K8wjV2EpAWZFs16mZrVeyLdebYQeyb6Z7wVJbTKjxM5OuDOm8T0q1lV+TOYKZ
	1wntoz7KSzl4w5w5TSDb9ERAVD5tw1ayezsHAqmJESTVs77tY9pwdFuOor197sHZsbQUq7q
	3p/F+e0ZbfAlMOwtw+bQOcmo5QwardVEwOmOvD0br8UDkvS+X847YAsuVXP+7UBseC08kwp
	ETBkETFKmR/F7LNyxnqCI45o5JDPB2wqmBxdPcVDZxUKDEuFZ1udOppYUFZZHUp1FaNupiV
	4iTlHJ1siXs0Btp7sb7ncc/h49lO0Ist8dTHqiAYUj5N/h47aUR2TbYSIDvmgIV6Ofe6NgH
	jxlsN5r7OyqpGPkTs6HWASu11XedK2lp7LNIfprjH2H
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: CD60C48DEBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59902-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:dkim,uniontech.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Laurent,

On Tue, Apr 28, 2026 at 12:13:56PM +0300, Laurent Pinchart wrote:
> Will all leaf drivers need to implement something similar ? How does
> that scale ?

Thanks, that's a very valid concern.

If this pattern ends up being needed in multiple USB interface drivers,
then handling it in each leaf driver would clearly not scale well.

My initial motivation was that the UVC streaming resume path is reached
from usb_driver.resume(), which doesn't expose the hibernation PM
message. As a result, the driver has no way to distinguish PMSG_THAW
from PMSG_RESTORE locally.

That said, I agree this points to a USB-level design question rather
than just a UVC-specific one. I'll revisit the approach with that in
mind, and will include the USB maintainers and list in the next round.

Thanks,
Haowen

