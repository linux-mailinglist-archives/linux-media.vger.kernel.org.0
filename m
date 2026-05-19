Return-Path: <linux-media+bounces-62137-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPd6K1RZDGorgAUAu9opvQ
	(envelope-from <linux-media+bounces-62137-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:36:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B62657ECE2
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F32930C7C42
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147904DBD60;
	Tue, 19 May 2026 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bD4LrUFU"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8532B233949;
	Tue, 19 May 2026 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193950; cv=none; b=j8gThWwP9hG8aM5gESJfF+Cc+61s9W76yiuOontYd/wnG1/0FBwOtJMxiOLcc0z1xZGmd7hdZH6DJymlRXxEAOULRHgkMlm8NNYC/6HRFjU0dKv8Mzei9VgnKLvYmL0oHOZUNhLlnz82/CRrFhYE0iecWrt/DN83TBp9mpi+lOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193950; c=relaxed/simple;
	bh=a3i+o0McdYohTrVqOh3i5ioTr30WGEXz7x2q0R/6iQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjmkZQBAksRl7rqvK8NdGPmBr8iLTziGHdcvTUNMm4VqR/n3UKeZ++/rWRidLS1UQIW9ou/4xCOK9rKRv0AHg2LAgGV5YEXVRoo2ZiwxPGpoxulVGDrYDAIbHJxnvKQ6//oRde82W6lMhswQnbGQbkCQK/BNj2q72PTbHytdtWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bD4LrUFU; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1779193935; x=1779798735; i=markus.elfring@web.de;
	bh=a3i+o0McdYohTrVqOh3i5ioTr30WGEXz7x2q0R/6iQE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bD4LrUFUa99UynQkR+0Haqdgw0dWp3RyKBUH8A/LzhDoAUbsOc0oiwArzrbVbhah
	 7OBGANqlIn6A0KGyV8mrfvU7c+dSaCpFjCIfumRmndbP0A4TNlg8rbZZWaCEQBLjx
	 VlbX9r2+JkHZbLYXNCe2JG4DZbOCbYkUA1yqxwpCwZJWjoXWgg2TKid5sBs3yD9Bp
	 KKbJvHzSy/Omsw2bJUsBq0wBRvwZG4hipgRxmYRJJH4dknj4rtWzdnL7J+VsXzkLo
	 NaO+L+IvZfx+0lqG48vC8FDSCacJqYh4i9KNMzBeVjVKNImsmrR8jrhAAzv9wXdWl
	 nHMJHfqEMikaFW+mqA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzTLI-1xKZ0Z263E-014uRG; Tue, 19
 May 2026 14:32:15 +0200
Message-ID: <056ecc87-c4ba-47cb-9aa2-5e3211da195c@web.de>
Date: Tue, 19 May 2026 14:32:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
To: Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bharath Kumar <quic_bkumar@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Will Deacon <will@kernel.org>
References: <20260519-qda-series-v1-9-b2d984c297f8@oss.qualcomm.com>
 <5e0d72fa-929a-4905-9066-6648892bef4a@web.de>
 <agxXc8ttEzBFOlE2@casper.infradead.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <agxXc8ttEzBFOlE2@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZCsSJd3hlZA0+s6pw9oSu6hy//TO5pI7XEUP2fNCggWZexrtIeC
 ztmJ2lavQ+zqx4kDCnaiWe2OloINiorh0ir6/HZHLmgzLjBnCWEje6lfH+2omUmIOxImtZ8
 oLJlyHHg7CSgf/fhhMzkYHPKesSLEMCEIdiyA3HuaBGm5L1K3/RB4gTtpny+qFIEcIc+nrw
 qec8gi9RND1ONV1qQOX+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vJshWSmoSHA=;XWZhCWYeZiiacMBiBDZaL9WPur4
 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
 b9UjQg==
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62137-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[web.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,amd.com,gmail.com,8bytes.org,lwn.net,linux.intel.com,kernel.org,arm.com,linuxfoundation.org,ffwll.ch,linaro.org,suse.de,vger.kernel.org,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5B62657ECE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Feel free to ignore everything Markus says.

Will any contributors care more for linked information sources
(in constructive ways)?

Regards,
Markus

