Return-Path: <linux-media+bounces-56615-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KM1GlvyvmlxlAMAu9opvQ
	(envelope-from <linux-media+bounces-56615-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 20:32:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C05B2E7024
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 20:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A28F5301E965
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 19:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039C332C92D;
	Sat, 21 Mar 2026 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="M28++In/"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767E7282F30;
	Sat, 21 Mar 2026 19:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774121479; cv=none; b=oGR39Ag+yLxzK6BLAGk9C7Ovndh8qv6MERX/LSJwaLESeXN6/vUrU/lQuQlJUny0kMDf3K7v8B+WrKV7w7oDCERFThmXOSyI1kvqkYd3HB8gCpAX+5f6fNyIF8E7bHmXXzmfPzRpRHOyTdyCzd5TYXNUvIv+Ysawx3rl8xH4LgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774121479; c=relaxed/simple;
	bh=F6FtN0yz3tRF5tU/TCASmMtptpqibqwzaWt7Yo9TZfc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ClocR9akdTluJ9eLOyvDNX0Rzk8zaFa2qkR+f0FFN4bLFODbDBqDvOqwyaLI0q2+XkGl3LLmqDq/mjma8fTkNNIQ8zFxVSeMXcJNC9QB48ikujrcRUgu79RN/yh+e7oEC8jDmvqCkr44NVL2qub9V9bQckdykav1HRUv3LqEV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=M28++In/; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774121454; x=1774726254; i=markus.elfring@web.de;
	bh=F6FtN0yz3tRF5tU/TCASmMtptpqibqwzaWt7Yo9TZfc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M28++In/nkZgNAT/goRO3CLg6boaXUUXtg3j5Mg6aYG7WhXIvvFV3IOF62497KCA
	 aJiALj+2rbw1KEbpXGnoj2o0oV3/8lWthRsAWjmMUmZ0lR6NLucIF8dhNiRDtTatT
	 Lj8JFH6bENL1PYSecftn3/FsfLdfvOykdJQxsuHkRH22CopdvuRaeSMqfy50xkpYh
	 uE5aeeuwhbiikyPrr6lD52H+cSCzJeV93LzW5JhSzgXx9uxXfAuzNlzlB0InBeVDk
	 i5L3ajVH/BF4RhtfqvOASOCgyhz20UOoE5GnHO0djsd6OoGGsfKNx9fRiRIWh28aD
	 nKMp2kM5BNaMjRXDMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlLE7-1vIqhf0Cth-00qKfa; Sat, 21
 Mar 2026 20:30:54 +0100
Message-ID: <020ac5a1-4427-40bd-926d-0ceeedbce1f3@web.de>
Date: Sat, 21 Mar 2026 20:30:49 +0100
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
References: <20260321-vip-v2-2-d502c1954817@gmail.com>
Subject: Re: [PATCH v2 2/3] media: ti: vpe: Fix the error code of
 devm_request_irq()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260321-vip-v2-2-d502c1954817@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:z76tXbeJUQYhwa8AbU/kDv96gMHHeQb9SmWY8kl9HASJgh/mwqH
 6vmlmIahQwpjK9XwbCCXGVoze+6keaJH3aTyejhruWJQ3ZSMlwZbfcYH/UDvz468eKpoqUT
 vzYXbMN053J68zdJFrXYXfJwc5ViOKb1qdc4GQPo4ppw7j20QGKDK5AKeNrGc6D4nvRYOTu
 +ekH4Glr2AglVhk5UQoVA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y7RCVExCREQ=;kVRo7NLM8UG2id4h893wIx/tmpH
 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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56615-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,ti.com,farnsworth.org,kernel.org,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[web.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C05B2E7024
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Return the actual error code from devm_request_irq() instead of
> incorrectly returning -ENOMEM.

Would a summary phrase like =E2=80=9CPropagate error code of a devm_reques=
t_irq() call
in vip_probe_slice()=E2=80=9D be more helpful?

Regards,
Markus

