Return-Path: <linux-media+bounces-58082-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPpYKBRM02nQgwcAu9opvQ
	(envelope-from <linux-media+bounces-58082-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 08:00:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 485093A1B6F
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 08:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA8F83003D37
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 06:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D3C355F42;
	Mon,  6 Apr 2026 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/ZO6os2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDWs9sH+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAFC1A6827
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 06:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775455245; cv=none; b=SVmXYMJYcizofD2ZxxYLi8YmDoubcXZUrkCk/q+ztq+qrga9dzfRwk2lFyuHm/rK290Ga7XYpDqILG4iiwbDWwfVoonJHFV1dxFaY3yOCy2OisgQUjbx8gYUnU3Y12qYfsPHm/pzE3uVjul6+pGJgUN84/mgPyKUKR4+ADBXyxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775455245; c=relaxed/simple;
	bh=W55SxH4v1TYu1d/lIxR5OvKL1AU7gdmNdXkaMEBZ7gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XgSjupwgKYNnPVZM/DddHVDMpboZ0SQGYNDpDQs/LZ7vWdu0taNILF3YCgQ5TLdfcjUhhGAxtpMYHBdvKrZUfIuuFnI1KlCbG7SDgrhvBd3GK1Poi8+ILx5pq0uM9HfrzwNXBcQutyCQ16Qo5omfzSrP06pjiQF1w0YfHFTd5Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/ZO6os2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDWs9sH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635AVO9P2365344
	for <linux-media@vger.kernel.org>; Mon, 6 Apr 2026 06:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4ibk9OYoGNB7wbo7aoLoa43aOqqOGyAKbKoa+PEyXI=; b=T/ZO6os2gecjpCj2
	qWg2xD1/uYio+n/Pp+azKfiTOtLTMahJgHu6kdvEFxxSbZZUD/dx5faJnxLIrEey
	4yRZiiKE4jfq8UL2UoivR2VvqFHd20qgfs6UDy5xGjVb8ybtezBYeg/ysSQjnc+n
	Xoxgbl+fdfRMqGpPBXYFrmYBtCMuVVIl3OERMIhHFIXJNykZ30bKfhn9en5E0cCO
	Z38cUdmpTw3D5tkWk8w+MksXQLNQJnduyab5mdtmXGfecu/XTbGmUwyfol4KP7RW
	CK0bo0GuBgWLPtpFt2V8jHkfBgR+xxn7cTn6EEpnfaJyqdJNIQNH8IApzpeOfDUg
	MeBRCA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14uya6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 06:00:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so3786522a91.1
        for <linux-media@vger.kernel.org>; Sun, 05 Apr 2026 23:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775455241; x=1776060041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4ibk9OYoGNB7wbo7aoLoa43aOqqOGyAKbKoa+PEyXI=;
        b=JDWs9sH+882bxzRLDpK/hxz6M7EmIdUDP/QrrD3LK0tQJElkP3OI+yWdpTVy6Zsufz
         kTzN03vo9nasJZAJ127AoGEb5/5yon2mX1mNN+faeSw6UoWLYCt44VgWXxXhqxa5zSfS
         W/qjkYGjJrhq29LvL2UgmHhO55pOgJabzpLrokLbqJyTp0OLJdj1EgqzvPVgs6PDBhwO
         t/ufor8TTHtiAIAPNGNlWvwxJrwfCWM46m0z1Cgbotd0nO/em3ZA1JsOkCZc7i4yU0gA
         STf6qljoZWo+lpt/8yKzDjFkoLR7fzRZSEePdnUuM0mRZZ3VgsMrX9lfL14YV95+l+dj
         6K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775455241; x=1776060041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4ibk9OYoGNB7wbo7aoLoa43aOqqOGyAKbKoa+PEyXI=;
        b=JVahuckWfphsRP+7HymkadDZhmBcDZRquHb9nhBNiy4cfFjw2oAmk3Bd12R/wB9VOt
         sQfMxsnIGMi6aZH2cPm8SUZCrU70RfqI5zO30AfoldJDZdXg+SQNyCSU/ZCjz8CcGQ+L
         KEoS+YKsfylGlx2MLrfX6b5Vy8t9lwoVYIpw70u2wIuIO9DojlIo75QTSj272ukLQUxm
         rOgUCz6xUoBs57rl2UmTTFV+5U59PGTLiVx6oeVi7GlnJ0E5E79NkGn2PuDoW/cwRjYS
         zamdp64SjsIQ+lCD6iuKBYKEfXViW2cacF+qlUxjW5OjbcUF+kcTmK2CfQDGJ6HC5wXH
         yvyg==
X-Forwarded-Encrypted: i=1; AJvYcCX7MabMBI2DmPXbKi2HB0y/PtLH52MiOEQln+9e9G4lI4zJh8BlsQyq5Pb6BgPqkorXZboGbXYx7GJx6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl1zQSyX2zq1n8i0jUbvaiOA9SpUyWZ+N3SKRL2r79+CoVgS49
	YioLwS+FAdtrr8i2bIlXEfiOtOsALFxqPbCX5YEJ3DSwDsDnZVZzmFeOQu5+qBO3lxyyUkybpkA
	Ihf6vnJOh2JYa8r7SeKOo3fJ8t0oMIAjXpk5//zANTBSs9zRqOhWdVxHJbVXdlrJ2mA==
X-Gm-Gg: AeBDiesRyGPK86WeXg9CxK3KxVt74xbHwCQVKHCR+Fu57O+IJeAxRap0yVVRk3+nn79
	v+yAFLVJsTdHCcimdMqkCWIu2QkbgorcwCjawCtuWUENX39l3bRylEFACy+OTUWq7FF+SYGcygD
	tv7+aHVt/ZYIPJJ8TYOLfnivmMMF4el9IgyKcUFGLc1/5mhpaQVKu2PKSW7G7KpR4kz6II0siim
	lyEr0pbVj3qONXkERDgF70GhNfsjhkXod6G29cULh+xGGxdMHEzmZMjWR/SqIQ5XDIvmYUNe2Wa
	fu2lxAoNB+5E9d+vQzkqmLS0OcFDY88/GpXnYl8ZqD5voeE7Q9WWCW91MPjAB9eSvGWHBwioG0m
	ithNRuO1z7+wsEBcLOuZLgaMrhqa1m+swwt8/qTCsNZdP8CkdFoGZLA==
X-Received: by 2002:a17:90b:1fcc:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-35de689500dmr11473515a91.10.1775455241332;
        Sun, 05 Apr 2026 23:00:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1fcc:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-35de689500dmr11473454a91.10.1775455240764;
        Sun, 05 Apr 2026 23:00:40 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27479d0fbsm162722615ad.35.2026.04.05.23.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 23:00:40 -0700 (PDT)
Message-ID: <928b3c14-fd3a-73c1-5780-2b8302fccb7b@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 11:30:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] media: qcom: venus: drop extra padding in NV12 raw
 size calculation
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
 <20260331-fix_venus_bug_issue-v1-1-e4ae7a1d8db2@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260331-fix_venus_bug_issue-v1-1-e4ae7a1d8db2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA1NSBTYWx0ZWRfXwdBPqNHkOx2M
 D1TZzSvv3vpifXoGTV8HL+2Q3lKSdiSxOr6q8Le44wWHYxuOa0y5KzTWL4rv311P2uKcZCS0sHL
 uk+Kb3DL/BPU3kJg+HpY0CiNw6HMaL4Ch2BricHU5LIN8MU0nhgZYeqysvtRDWPEhqis/E+nt7Y
 t5VrvO+1MZkUL/m7wGrjqiFRVCjR+P3+o90s/7YtVlkBGRaxTYBQPxfcxshDgCBVVoS0vPaHOLv
 iZO/bFUfcfQ6VKWoMUSbRn0qPz735yceV3+oYYJZIxSJNqLipfewZXw6g8j7FPqUf7EutuhAqJ/
 df1gSBLEBFyPBs3jYUYRwLuFH9YpLxuSk87UEWXqOML03DZa2g3X5zN3KerljyydHVHP6dsswj2
 VZ0Y98/LIbyFtU9nlPFvPcFyedFQHuq7SrrMLhGh530U2Uv/KdxSg2S8HMLAgaunZhcDndU+0nv
 NHY3CekvOACA3bqDYlQ==
X-Proofpoint-ORIG-GUID: eIytSAtgpk1bVRcpVV7cpX18Pur8grK_
X-Proofpoint-GUID: eIytSAtgpk1bVRcpVV7cpX18Pur8grK_
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d34c0a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=AZq5V9zQ+e7Vr/IEUKe0sw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OLydivoxJDyelnFudk0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060055
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58082-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 485093A1B6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 10:07 AM, Renjiang Han wrote:
> get_framesize_raw_nv12() currently adds SZ_4K to the UV plane size and an
> additional SZ_8K to the total buffer size. This inflates the calculated
> sizeimage and leads userspace to over-allocate buffers without a clear
> requirement.
> 
> Remove the extra SZ_4K/SZ_8K padding and compute the NV12 size as the sum
> of Y and UV planes, keeping the final ALIGN(size, SZ_4K) intact.
> 
> Fixes: e1cb72de702ad ("media: venus: helpers: move frame size calculations on common place")
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 747c388fe25fa30770ac2e81d42f4daf83d74ddf..59eee3dd9e06c27165f29fc034d151eb13cd2349 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -954,8 +954,8 @@ static u32 get_framesize_raw_nv12(u32 width, u32 height)
>  	uv_sclines = ALIGN(((height + 1) >> 1), 16);
>  
>  	y_plane = y_stride * y_sclines;
> -	uv_plane = uv_stride * uv_sclines + SZ_4K;
> -	size = y_plane + uv_plane + SZ_8K;
> +	uv_plane = uv_stride * uv_sclines;
> +	size = y_plane + uv_plane;
>  
>  	return ALIGN(size, SZ_4K);
>  }
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

