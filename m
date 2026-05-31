Return-Path: <linux-media+bounces-63154-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOXAMAx7G2oDDgkAu9opvQ
	(envelope-from <linux-media+bounces-63154-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 02:04:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD7613F52
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 02:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90A5E3036384
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 00:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0AC3AC00;
	Sun, 31 May 2026 00:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7zNR2he"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ACE846F;
	Sun, 31 May 2026 00:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780185783; cv=none; b=BIjK5FgZ1+huOGz2pOxotoUn10VtHlmygAwvK4JeFT9psj1L4OOxSxh7Dl3RHYkqv6loDV5+rbz7XHc5ufoMIJTEnR28MTO+IYa205IMxUjRlRz8I8dpRTU0/Ozxq+rPCffRLL7ZruLVt2QG2aQ1T+yeWuBTD/k8hOR9pBN1+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780185783; c=relaxed/simple;
	bh=Z9u1oW2wKoYUFerfO3+NNjW1aMjKFLWSuivvY8OUmzs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ffnshN9ISGxq81lp+yVIcCxtAL994Pxpd5x6RDCXTAshlBdUPxEQsPrXmesVK5QiNZTGA5yqZy5/duPPMU0xL4AKD78qC8/9VKkJ5xNwHIUdmWXphhWr/+BLz3iE/lgHITmZ7tr6Wc38GVFG+L8+8xRH3jM2vTCMapX2TJ87QOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7zNR2he; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985921F00893;
	Sun, 31 May 2026 00:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780185781;
	bh=E/kgCbO51MXbL9oifkJT0mhfUszTtnnQViWE0UsiJIY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=i7zNR2he8tEbaG88UTxQdaF1jW7bd00G51kEF0O1rx2186G5yzaGnE1ejotOaSzVe
	 dFtKNJvA5U+o8ZiZ7E9VRQTtNWLbFWH954CFW+nkuw5L3OTzunRTvqiXyD8V+KuBKG
	 UPGIowJLZ4oHCrzxDabjTTui1psEZcTzWwcO+BCTjZvASerHBMOGiYUnTOsgoAYPKm
	 /Np3jFlWXV7ZDzulSplLaytJTCDkMDEVkHf0QdK6jy0STqb33duy4a3T4128oBHyx8
	 hz6UWc2dxy/Kc/Kjygg5uMHtOSLLjuuFlpCPKh9zGkuhCB+D+1skCnRtKbFNBeelRT
	 vf2JmRb5MMqoQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/7] media: qcom: iris: miscellaneous code-quality
 fixes
From: bod@kernel.org
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
Date: Sun, 31 May 2026 01:02:56 +0100
Message-Id: <178018577638.17481.8795314326310569500.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921; i=bod@kernel.org;
 h=from:subject:message-id; bh=Z9u1oW2wKoYUFerfO3+NNjW1aMjKFLWSuivvY8OUmzs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqG3qxCALSvbALwlbfexFDoC7qs6IyoLwyfKwIJ
 mUtaRXw6JmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaht6sQAKCRAicTuzoY3I
 OkdID/9RZnOp+Htj1rvqUp5NjnUunnlxpONMQ0Fzv3WNzqVJOXYIcFcWw8uG4Zh3To4Qw88cUKN
 F0ECbdj5Jindt4nAQdZ1+d5LJE+j5k1ifgeLT8l8AHvTfgmqt0jyHTOeZ3Nq8thaNg31aFo+mFm
 b66+9lsN5X6sBjiYeV3FpwJ7OwTkyiwMNrwnLEfGhmWuSftXGILy0hCyspnJGty+9pn2m6QNdh7
 sg8hVe4RdFoZYxy1JA5YDkwTfh6K69wuPKEIsLiCuPPFoVr7H1XV/wZzpMhKiRx+KMEIQFFEBH6
 Yh+TyJyEYb5hBPXPEzD0+CWnZPe2n7jYI++qjbDNKqidrJqxhw4jgtt76MN2/22UmcCICBeyU1E
 60XRaA2vSBcrZIWDzWMcdyS5lqwf1uebJCKIXb1zA6BwIT3Q0tL4nzz5tsPQh1+dOBYoyY93XIo
 W8R5k9IIGT1aH4/GGyk9ScKg658BSl1OfuBVKslRg6bX/sZZwVlWn+0topnkHQdvU5owxtvsDPO
 sS5QMzh8UPFzafnEkwpSQT2cpxjvRbSzdiD/vExS9dHKeaxOt7AqkMeGcO7aXbZD8MAbyo57FPu
 WqukCu/VsjVGGL3wNZ/UyiX6FCp6Cvdu4kwOeIPxQhd0e8qKFZiXjukNQMwqQYwZ1fWyRacMjIo
 w/D+uJ2MxFQ+Z7g==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63154-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 30FD7613F52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-23 17:30 +0530, Dikshita Agarwal wrote:
> This series addresses a set of independent code-quality issues found 
> during review of the Qualcomm iris video driver.
> 
> No functional changes are intended.
>  
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated variables names for iris_get_int_buf_tbl helper (Bryan)
> - Removed un-necessary fixes tags (Bryan, Konrad)
> - Addressed other comments (Bryan, Konrad)
> - Link to v1: https://lore.kernel.org/r/20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com
> 
> ---
> Dikshita Agarwal (7):
>       media: qcom: iris: Centralize internal buffer table selection
>       media: qcom: iris: fix state-change debug log printing stale value
>       media: qcom: iris: Fix bitmask test in iris_allow_cmd()
>       media: qcom: iris: Remove dead assignment in iris_hfi_gen2_set_tier()
>       media: qcom: iris: Remove duplicate HFI_PROP_OPB_ENABLE entry
>       media: qcom: iris: Add missing break in iris_hfi_gen2_session_set_codec()
>       media: qcom: iris: Make iris_destroy_internal_buffer() return void
> 
>  drivers/media/platform/qcom/iris/iris_buffer.c     | 123 +++++----------------
>  drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |   7 +-
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |   4 +-
>  drivers/media/platform/qcom/iris/iris_state.c      |   4 +-
>  6 files changed, 40 insertions(+), 102 deletions(-)
> ---
> base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
> change-id: 20260420-iris-code-improvement-19409f16258c
> 
> Best regards,
> -- 
> Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> 

Everything is RB now but not applicable.

Please rebase and resend.

---
bod


