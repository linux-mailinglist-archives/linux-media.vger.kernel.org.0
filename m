Return-Path: <linux-media+bounces-62153-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKhPOlJ9DGoSiQUAu9opvQ
	(envelope-from <linux-media+bounces-62153-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:10:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9D158125A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB387300E727
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFC032ED27;
	Tue, 19 May 2026 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLJJB2nH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5323232C92D
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202714; cv=pass; b=jUN4jjZRdEpYuAeKF92mJjmLYN94LLEqCb7PZtoBlREsegXrYK73/CJmdufy99zLAxSL7j2fMdsVT4poeK8+fxcIUO9muuLkauUcF43NgYvbOvjY9/3PppEhF7tHbJruPK7c7+S2xBioT+sRLzxJJnHxZduAK5iuVuj75EB9G1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202714; c=relaxed/simple;
	bh=l3p4hlk9sS7opuOA7VO5OZHIfIWDFrtovs18Io6gwXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ay+K1SQDyzutof6yCSn1CjlxxZjyPx3+Lk1GQ3WVoUxuMYUWS8B2NOQfWCAFDx7ZOMfH6Jg1CFIubR6Va7LbiQpLSXZjeitA3y7+cATs1s4GEPZIANKe3Mr+xOw1qj8j50ccUbR/Yg2QOD1F6MSCr8TqnPpl7Kh64EQg5TwZ+Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLJJB2nH; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c7efdb7d8so3829603d50.3
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 07:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779202712; cv=none;
        d=google.com; s=arc-20240605;
        b=Gv0cm+1gB+tESNkaA96loZ62DGIbI3ZWPlHWow1tR+v4b+p2cZ5MShtv97OdBvmlpc
         Xy41yUDmR3bnPCh5vafJIj/rmm5flHPjtcn7lJgBzTx1A0FvEXOMHFQhHIPVyW9xJzJt
         q7VUjuMHvHGhPoZWUWVoHS3wwqaFOVjaGKk8hD5V93SeS8L+Rg5g3GUsjvH9EBID4hsk
         QlNq/uPUQ5pYX8wJjzxeFYOp2GX2dVwd09dZUj/nEx93q9Xyl0Jvj/RSRt7kSWQwLx5j
         W3CcdfHpQQaDuLulVdatMW3xdk5eynf+CXc0kR+p+FvCP9jI8yR5sHmDei18CaymA9Jk
         F4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l3p4hlk9sS7opuOA7VO5OZHIfIWDFrtovs18Io6gwXA=;
        fh=v19bYgimAC6M9v4naizyQUor2R+XpTDby/fo6Wzfazc=;
        b=XTIfJet/MDx8U0ECQxd+ciqTZ1I/k8pE+1JfVKozyPoXGwG/Bmo2mNOZGH45GPtZIm
         BXvdPpxRdPSKfNZlNPSqhVuzqQLPxj16M9n8NNqGZhWhN8oug5flkE1Ogh6FFYoQDWDW
         Gq8msltm69y+CMHCVcaZD8J66erP+dfYQ5q14uq2zyXjpIRAA93x23BTi40MGyZHEelh
         B3MncDsxSr7TGm0jyyNJ8Uo5OLdlMbSXcW4l1AGX2O6MyirMfMasIrXIdil+xLk/x8ab
         jfIJY+7FtxtwYq3Fznl1tof0UUG6xpKq+rRcyQCatvAEahLeMvjod8cy5IevwVg4petV
         R/PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779202712; x=1779807512; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l3p4hlk9sS7opuOA7VO5OZHIfIWDFrtovs18Io6gwXA=;
        b=jLJJB2nHdKyk8j285ZLJgRp7NAsHuR9QKltGwfzFvJ5Nq487ndBN5o49nU0oJLA+KL
         cT0rJjAN2x6eRIB3ZsQxtbzYBwpOfVPCxIigPzu9A+xyUtElP8jPC8TeH2cx0CWNNihq
         RrBJlu5rRmruK0XyPRl0K179xTw1uDzmGpieirplcSv2s0Bux7EmDbJQJ82hcwVBLZdW
         FGjRJdorjK6AoUtntOzlY9HZhuwM8R6FqoVIJ4e/X0LUr19sSiPNV24TrQ02BzTWFA+M
         p08Y/PKaNdrISPXucG7ZSU06FiYS8JTkIuGqfrIiEoo+t7zhcx11l7SZTVL4WaqYNVFx
         TDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202712; x=1779807512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3p4hlk9sS7opuOA7VO5OZHIfIWDFrtovs18Io6gwXA=;
        b=d4BvuOH4ORng/nKmOlOowGQBxGb45ZoGZGrVp+ecUFtcxgwr+7ASmEHCIe8Qb2pUXI
         4lsYqiOwM3SgTa0NV3L12HQeLuy1cBjQCNl5D9Jpan/efs4x+RiyaLCxO9gdIsl1Vl2S
         LJ+o1PS7QmDXmBsoykJuS0h9EIHzmrcaAkvNlFbBnMc1YMWEMwDPQkDZnA4hTQDATIl/
         iMbu7GDzgsP1xq9uvhofNcJFG5f0WlPTSLSXdxJtEney4rouL0CuVzHoct5RVb8gmcr2
         5FHFbxbvdl22sfAyYE37kofKEu+MMjSoRk/CbLF6oPdicU9jvrMuRtIhFs5eC66Rub7S
         pnCA==
X-Forwarded-Encrypted: i=1; AFNElJ8Hdj/EoDyrUgyPispL2HWoAyQ4ftMTlf7HZ33SsPTWiRxkbQGIMQWwU8quLx9U9W5e9wtdz1NVuZbxNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrEwIu6l0mvceVr8qqlJacy+0nhehHMMb+5pNwcnbByC/UB3aa
	tRizYLLpquiNOJydreMM08tKbEy8jgpizCPCWOjA8DqWiB2i70tM+j8nwu/xRkClV+UzC4BUFXQ
	hSHe7WFctkgELzQ1UY+KXeiAdFV7SimNfz1W/+bWGYA==
X-Gm-Gg: Acq92OE9DgDKCmmM1B0jasusu2FdixXYlfcqy9dDGK0Z/Yz/iW0hX6peKF7OllT+hNy
	jyNyaQw1ljwreRVgw4KQwPoHfU+CD+sDSvkukrGkDTJIe5/W4A8wZJBpZtS++M96y2Gqh/0Dpg2
	7AJvzNu3cA4RQ8QJnr4y1P/8sce2Hj8QOUUjrofPcADhUL4NAF3kLg4bCAdrHIwzRd2TZpfFTPj
	RIoENG2mnpbZLqvGfy5p55KZ7z72mN8+lqNin/XHvxlPNK5dQevNN+oKr1K+jXX9A3Qi5+9B+Oq
	7oP2tZhz
X-Received: by 2002:a05:690e:168c:b0:65e:44a3:ac3 with SMTP id
 956f58d0204a3-65e44a31552mr11608408d50.50.1779202712253; Tue, 19 May 2026
 07:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com> <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
 <ihn1XgQJPFsYvuTtWPxpZWwaQBVXHDmJ6Kp6i4DmDowTcRQITZXJlaVsbtkW-bpWydiYGAyyh6c9QLs4Nsn6lA==@protonmail.internalid>
 <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com> <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org>
In-Reply-To: <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 19 May 2026 22:58:17 +0800
X-Gm-Features: AVHnY4JwsTmHAUbPCIVWMj17cj7fD57M9j_aXkbsWKunhN7KuiYmuC8VOXegwz4
Message-ID: <CANUHTR99NHPRP3ooEXEBHf4Fksy0B96vdoV3=mzoMBawVgek+w@mail.gmail.com>
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register failure
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62153-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4E9D158125A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Tue, 19 May 2026 at 21:20, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> Yes I take your point.
>
> So what you are describing is an error in the software contract from
> video_register_device() - if we look throughout the usage of that
> function we see either the pattern we already have - not checking for
> NULL or checking for NULL - not the double free case you are addressing.
>
> So really the fix - the place to litigate this is not in Venus or Iris
> but in video_register_device's cleanup path.
>
> ---
> bod

Thanks, I agree.

This should probably be handled in the video_register_device() failure
path rather than in each individual driver.

I do not have a good idea yet for how to fix that cleanly in the v4l2
core. Do you have any suggestion?

