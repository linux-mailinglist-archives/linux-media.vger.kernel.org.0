Return-Path: <linux-media+bounces-52857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKYSCDbrkmlSzwEAu9opvQ
	(envelope-from <linux-media+bounces-52857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 11:02:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E01142313
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 11:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F8353017527
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04132EBBA2;
	Mon, 16 Feb 2026 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYU+A8jE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF2E2BE029;
	Mon, 16 Feb 2026 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771236136; cv=none; b=p8/pSNbGZvNCOTDGO0twGUam1WCQrVEYkCYCngO9DSmxRbNhxRwotjFPTYXCmJKU0xm8r9UUkevhGgnmwB7z74Y0iwJ7BG4mDjh59JF8nGEULvvQkoodlTZAy9KdYIN8t34UpOnroUxvoJduLxaa0/OzvPZHJL0VxHtnKIH8SwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771236136; c=relaxed/simple;
	bh=XpjUJ9uT3ucH1b4m7SF/LwJHzZUERRuxCEv8ky+yzc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXjbmz8XxtFMilj1mBdNtbK5Qub9KTkavxgKG7fWITitFc6xw4y2XJQgnFhKORz8tK9EKtlBEqdR7nqWJ5JG4OoSojILMPFHcpl0XEQORLN5SihGcn31QCZzaN+TnB7gMZNBYq0waRCHMLf3ikGprukNzS+1KMawTHQ7vKFSLZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYU+A8jE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B67C116C6;
	Mon, 16 Feb 2026 10:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771236135;
	bh=XpjUJ9uT3ucH1b4m7SF/LwJHzZUERRuxCEv8ky+yzc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MYU+A8jEOJZSVHrYWv+VTiBvdq61qb2VYidi7xqc4iS41GdJg/9FPJI0y1SQ+/AR+
	 ldUuPNFRsFd7DpFrrSoAZCBlKOO9hBnM0MJbx0aY9/NDc/2FBymKtoPIcqdOhj1Qwq
	 Lu2eLNsmSwgdEW8+SWAMfBgDlf2+SJe6IQvN0fkd68QMMFqa2cn0bUb8IHlyn+MwlS
	 kPDl6tTra1xEjyZvwQkRZMcPviZzqBU9nFz6KBn2np5UHQuEhEzSrEyh/yATePvLN+
	 OedCZjw+CUmuBLfyhZ2dDxYpHPZFrlNmqbLLECL30dYE30Qbe3auzkZRRTnvVIRaZq
	 bSSYNEoEKoZjw==
Message-ID: <b903f8df-713a-471e-a81b-4622f0717351@kernel.org>
Date: Mon, 16 Feb 2026 10:02:09 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: qcom: camss: Add SM6350 support
To: David Heidelberg <david@ixit.cz>, Luca Weiss <luca.weiss@fairphone.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <20260213-sm6350-camss-v3-2-30a845b0b7cc@fairphone.com>
 <Ajuf6CHwIGDKKGImYDmYgW38d8CqcDOhHQCfcuvVNewpxsMJBw0KQAjGrgVF_xeTjU93zZZe9BTGOS5dJKdp7A==@protonmail.internalid>
 <35d488f6-116e-4840-825e-934eeb0021cc@ixit.cz>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <35d488f6-116e-4840-825e-934eeb0021cc@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52857-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,fairphone.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92E01142313
X-Rspamd-Action: no action

On 15/02/2026 12:46, David Heidelberg wrote:
> hex numbers should be lowercase I've been told, otherwise LGTM 🙂

Sentences should start with higher case !

---
bod

