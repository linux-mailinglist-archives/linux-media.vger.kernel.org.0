Return-Path: <linux-media+bounces-62787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG8bOGWUFWpSWgcAu9opvQ
	(envelope-from <linux-media+bounces-62787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:39:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6525D5A9D
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 227223036708
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA23B3FA5D2;
	Tue, 26 May 2026 12:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuWQH3d9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2277B3D8101;
	Tue, 26 May 2026 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799127; cv=none; b=Gaby2N3/BCyeEy+dt7dyArAFxlNIKF8U9YdWT+CGdJGpeJjvn2kTv9l+uLjU+lEyMK1M5DsVk264FY6BUiIaqltDuDw+Gd3ch7fWMXpwztp6s+8xahJxaFrtPAY0gCVAxrxhAeBqvREOJOVwtL2MJoC6iet/7datyhpzbWMmTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799127; c=relaxed/simple;
	bh=t0iydRgSwDFEMK6k1KseNr+3aXo1AV9hjpNXE/rRBq0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LAW2PYlOiNdQoWuOh6GHCBGBvBOK083B4pgKuMST06gPxHXecMO3fs6tv2TGkyqLl4FgnbaQmMw7ulKc+BbYN+ANVgLDIVr96YDhd+DX/WtWJRmw/NtURC45zxJyZKWnNmRm43mpFZxbHoZ2yjRhUYjQsk/+K6t8+oF61rj6JWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuWQH3d9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63651F000E9;
	Tue, 26 May 2026 12:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779799126;
	bh=v5rz1zrwj3KUmzMms6Rb6tw2f15wO4fWp548EcOL5qg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZuWQH3d9Th7sye8V9YEQJDHCRZek6m39I/ZhHhzDm1vhMhidEWOMTIpdHkuzHfxC2
	 9gNKEKhOfigi3nHn60sVlClViV/kOZTyR0EeKVoKdEj9Eme167hz7VRW/S1AcHwSSK
	 plV9is1UpaSuZeFWGRwBStja7NYFDwaG2JbEUaY8ZOj4bgYhnf/znwM7WtRmMw8Trl
	 rvS0UChtFzhjPT4I3UN5hgDMSvkd7cJxZdnAaIHv+e8QXCUqYYfVrcVLm7p7csMHC0
	 PR7mXzJDZNDd+VcZRsmxEUopdpYwYnKka7nv6MfozfNnr9aTSUw7HO0/VsNFZhjmoy
	 cM0PkLfA5W0Jw==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 3/4] media: qcom: iris: increase H265D_MAX_SLICE to
 fix H.265 decoding on SC7280
From: bod@kernel.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260327-venus-iris-flip-switch-v5-3-2f4b6c636927@oss.qualcomm.com>
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
 <20260327-venus-iris-flip-switch-v5-3-2f4b6c636927@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:38:36 +0100
Message-Id: <177979911665.6300.11726562589723045774.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1342; i=bod@kernel.org;
 h=from:subject:message-id; bh=t0iydRgSwDFEMK6k1KseNr+3aXo1AV9hjpNXE/rRBq0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqFZRP+9CvMEbRHbJf9G1PK+YikVxNvu5X6aBb7
 g7TlpICT3SJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahWUTwAKCRAicTuzoY3I
 Ohi3D/4kyw4u5zvpfS8WbdMJlN0aS2llFCcRAL4kYmMR/Sx5HhzhxlPs3d4PzEw/9U5OL7VxsrK
 vsXoeMfV5w+2QRvINEfKt12RHHRGqDP64zgH+0uPFWcYEsXsZJYQn46lgClB/JF2rgKWsk41qNm
 8clZnuVm1CWM5k5MTBQBPgHpQy9xuf18eD0EmTDdpwbn5KPItp74DBGYb/Xsy9ydP2YlQDEjKpl
 si4TamgqGVYtZemUpv+QVF2IJgiusJ3fmcGS9dN1o3ndUQNKRZ3irNTviqZvHZMq5YGepu8TeM9
 pWmE9QuZCNdNdvwY/u69zP0+uKeOnXLhPPN8mZvTDHy/Tc7jXq+gcAgx9nJxVz8DXyGgnqfhLuq
 gX0Q+GxHODWW1YZ1Yk0FV8bx29NXxesbjqnQQOaI3m0nN+i9LRw8J7dsTHeyzD55rtgp3n7/10B
 UhYpVGXPmZmlH2m5kY706EJ7rKcfQguFYgqDr9lDpzmlkL/1fOVF/iXwNIW+jilPRIdRWu3ZgKZ
 w8X7kltWF3p7jhmlYJzoU4NxcR0a5yTM9/76KD4+CeSHuiFEz/v852tU80YuobosxV1Yvwe9IUz
 uohr9AobrfFtFLhlixsvUZGUhsPVM8kc/C5WC95IXx1JLiP4I2LmKTsRKnxbK+isF3eNZiI3+1a
 2XHfYzKBUtVIn6w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62787-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 5E6525D5A9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-27 22:19 +0200, Dmitry Baryshkov wrote:
> Follow the commit bfe1326573ff ("venus: Fix for H265 decoding failure.")
> and increase H265D_MAX_SLICE following firmware requirements on that
> platform. Otherwise decoding of the H.265 streams fails withthe
> "insufficient scratch_1 buffer size" from the firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 12640eb5ed8c..8c0d6b7b5de8 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -67,7 +67,7 @@ struct iris_inst;
>  #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
>  #define H264_CABAC_HDR_RATIO_HD_TOT	1
>  #define H264_CABAC_RES_RATIO_HD_TOT	3
> -#define H265D_MAX_SLICE	1200
> +#define H265D_MAX_SLICE	3600
>  #define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
>  #define H265_CABAC_HDR_RATIO_HD_TOT 2
>  #define H265_CABAC_RES_RATIO_HD_TOT 2
> 
> -- 
> 2.47.3
> 
> 

This seems fine to me. Vikash, Dikshita, happy enough ?

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


