Return-Path: <linux-media+bounces-56185-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNiJNPFpumnnWAIAu9opvQ
	(envelope-from <linux-media+bounces-56185-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:01:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E39E2B89D7
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC5EB300D635
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC77E39D6DF;
	Wed, 18 Mar 2026 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="uct/kHqk"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5703736212C;
	Wed, 18 Mar 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824492; cv=none; b=SKizclHnzqmkMEGXGvWA0BiMq8ykq5Q/QfogPdW3NT4M53krESLZvZl9KxyPWpgl/wrvhLHpRJR48zOZ5AAfOwCJfrTMfFQ9wdjMKYZpvFtjzQaqgmDFvIm92WPnNm/aYyzSOLUdnyvm7ImkkdowVXx0GB0sJItZEx5kbxp+SSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824492; c=relaxed/simple;
	bh=IoTdTBN6FXpV/1QoDutTwYFBH+yCVlRLkygM2NXqHVc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=mHqCPRYLxH3SEt0batHvRE2FLZzpBWJBaKjgJ7QFhLCczqbMasfMxTHbkxOyf+NfxxzFJaLGRMoKsIZJtp5Ss1WMMqEqFuZ+S03On3yIRuduMiUQ9WZGdRQyLABq6nPZlXRsY7azZ3keOkr17HT2mpezx1NrX34REVgIs+QiJCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=uct/kHqk; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773824471; x=1774429271; i=markus.elfring@web.de;
	bh=IoTdTBN6FXpV/1QoDutTwYFBH+yCVlRLkygM2NXqHVc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uct/kHqkzbI8doTo3JkPHWXg9UsK5mStEda8OwF7SjqQ+p4mRbRrXu28HCXcaVIr
	 fTnSXrS718RdGRqnnrUzDRMe5jqmORCfL3x41HCG4uervoq2esn6wvhoYiVGhF+nl
	 8y3vKB+j4PT4UEa35kHldcWybH85T08NRAZWTAX1oqrcX6/7WbrbfZvtWfkRDhHsl
	 TpxfDR7pzT3z92ylIQDJ4Aj1NTvfXI9AA0Kijd36EZ/zOsIHp6Enta4TkflW5Ampq
	 0L0iXeyAbzQrPsB4E5cBXUw5yDQlWkB5Mu4ZF5A9Z75lz1uSKJcUtUsg7D17oVyhc
	 cOEf51nA/dvhQWWsiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MC0LH-1vt7bm0yHV-00HY6Y; Wed, 18
 Mar 2026 10:01:11 +0100
Message-ID: <e067fe4e-7e8d-4536-a110-b1a35d66e202@web.de>
Date: Wed, 18 Mar 2026 10:00:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-media@vger.kernel.org,
 Benoit Parrot <bparrot@ti.com>, Dale Farnsworth <dale@farnsworth.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sukrut Bellary <sbellary@baylibre.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260318-vip-v1-2-5fdcdbd01829@gmail.com>
Subject: Re: [PATCH 2/3] media: ti: vpe: Fix the error code of
 devm_request_irq()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260318-vip-v1-2-5fdcdbd01829@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BzrH4+Q5DKQx2rMfvrpbuhXb5PDyaPVTWuT5CIQjtbzPEGoQS8s
 nYjTb8VUOcSf7HEvpd81i7IYttUk4L8nkbe7e71wjsUkq2WqrVDGgIT021v0jZzxTHXpZxq
 sqMWIVjcy5/R3qGF/KCkg/NN4CCp/HS2v6c0xbh22GqUnM9Lz9xi8HUYnCw0/6hLU+zh1v1
 6UqzQ8aXTF4LK0GTCKkgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wx+rAUhHOEY=;MdhUcwKXSDIoadcrantAYOlXj/+
 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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56185-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,ti.com,farnsworth.org,kernel.org,baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[web.de]
X-Rspamd-Queue-Id: 7E39E2B89D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Return the actual error code from devm_request_irq() instead of
> incorrectly returning -ENOMEM.

Would a summary phrase like =E2=80=9CPropagate error code of a devm_reques=
t_irq() call
in vip_probe_slice()=E2=80=9D be nicer?

Regards,
Markus

