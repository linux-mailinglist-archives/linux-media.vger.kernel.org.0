Return-Path: <linux-media+bounces-58323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK0SLll712mXOggAu9opvQ
	(envelope-from <linux-media+bounces-58323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 12:11:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFB13C9016
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 12:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6FC630479E1
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 10:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD363A8737;
	Thu,  9 Apr 2026 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LhyCJJdc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE635DD1C
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729123; cv=pass; b=K9/0rXXnXXkd6761lACvGmpoAeDZeP50aNEROYsmsT7Z5kz4GUGWuxyDW6ZNgoZM8dFTsL+iI9Ifu1hp3qiinwB2dgCj22lPC9kVQVBqfrK3KYiVYcLTJJ4QhxjywKxoKZLEHGcVEeRP33fTII4sk/C7abIIkMdHUFzE+jQCzjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729123; c=relaxed/simple;
	bh=RROMFInh79PGacu3ZvW0OlGOhCieH9GPPWOWlBqVqR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4+GlrI542rO9iEmZm7RC9tdzIZAf+LKci5TGmAjMTlWYDOcMz9/FOiGX1qGubg8ize3QWEFs6yYSwzXjSR70K/m5w/JD6n1QQqTPtPph+XdDjY5u0sl1wxNj9orR9zauEp+2HHjMzOYedzRvfxDs1fwmpVWpid80HnMAjflmpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LhyCJJdc; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so765326e87.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 03:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775729121; cv=none;
        d=google.com; s=arc-20240605;
        b=h9nDQDQaL8IQx4PHkl3CgJT5J5Z8W8H+thLskAZwPJ5ZcjBs2uYB51miymVs3hXaZS
         M/zZTp15DcZcp25LtdwtWno2sAFaLGBs3Hui0va1EN7lHFwZcdeTY6zG4FV13J5nTds8
         cYEtoD4acdpP1Yk7ZvjzQN6lrLtPTNw50alPSXNl7I72VA0QwN/eyUNmDG28SLYPVStD
         JoikB2diBLNYVTOhcOOS6rd6505nrJ9mw7M6DD0lhey44ufumVrXuldYvF0PpFC9dTM8
         kIAOeuNQSNqBeD0ZJwd8zaAhFurQOhvJycPqeKFHD8YQPtwg2zNxFLjpaXulxKowX1sZ
         v9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U0EjKVMSezJTfKGsgUH31tGHy/yfbazr6z99/gKR8m8=;
        fh=xofQFDCRdPhC5jjW8Zrp5Ry9nN/ETeH9Jnxa4ko4Rgc=;
        b=Ok0BQUCYJNoWK/sqczQC363bNSFNMx39OHwbnU+Q8ojEDAlKo1jFywS+6XWgDBrIrE
         An61Er9Ci2Xn8/MYk/C3B0y1JcT/3KpHtZGbslnhGIfDpt7+flOJ8YJwFd53uOvCzBTp
         Im1fI6tPXykptfoCBlSK2fXq0eBHno+X9ILftudMCanAkhx5Gyb+/K6vDb8k1dvq0Hxk
         CXHS82cTkRWheZWgM0vVmQggj8G/l0LgZKR+CQL3Yxcrc0eCLkjXlwei6OMlGEpiG/aS
         EzIBda8NBgcoUhcYpNQFZXEZK4LOPTa5wr/Xrm/QEODocVr4F8hDOXCR6GQkfmRLQbMw
         Drdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775729121; x=1776333921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0EjKVMSezJTfKGsgUH31tGHy/yfbazr6z99/gKR8m8=;
        b=LhyCJJdcRK53hlRdpU/+evLe8TPdoB5xURKSfpzV8druRxFSZZW+y3cqlrutUXdZpx
         q8fQWGe9wwO9LoGGQJcX2UHxhSWhvs42b4CJlz0vXaWYkQMZRje47T/7B7E/3u0CigdN
         etRjTAKSkLNJzf7G7VAZl9/h32IRSQYJ+aTCxr1jqv+wODz8ZfEThWfspiO+/bDIHdZA
         SBuETtxvKOLAsVGcSVvGfUdCdaWCb1zMKL3ud8InIyqOYM03lv0UsXGw0ufSmgM4TQJh
         vqa7oBOAlEcLBLUEPc/M7oFKffZoDJ6YIRTvfgrzz9jopS3GCQwBGxXhqq72A+wCgkhI
         9cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775729121; x=1776333921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0EjKVMSezJTfKGsgUH31tGHy/yfbazr6z99/gKR8m8=;
        b=SoCgNqrQ89n9oSMkAt02pHf/aS7Y4N+PUHOwGzDpFHvoQxJ6GPcmIfogba664YGpEe
         dDEecv/G5oDtNf/VevQNgGEyHaYHajIg4Cvnw6ExWk3r3vYHYv/+XSzZkSHFp3ijYH2i
         L8iLgg8WLwFQ1WzXEggko8qIgxNNh4Pg2sse9oT0yXj/Cukg3OKPCAVoH7Lyk1DlD6Ti
         ZA7wr2nHepyDMSVjLvCoiEvAdc9tgcx2hyGeZxsNlE+pcMWGFYWTO3q4KEmeC+sq02ee
         NhDctNlQlXNjQv5hEltQXYeHn0CMWLI6oT1pyene1y33SFSRz50Xx5orkaXrNrem9293
         ge/A==
X-Forwarded-Encrypted: i=1; AJvYcCXNeSVmdGGPAIpixCkkYwV7HK6odz3guIPgEW271GA6itTdBgUh00kDcX1XsrKM64eCTb+mHrrkNeBsuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPO0VcZbSPgHwiipYtn1yMsBFC6KIsPg1TwThCEJSuK/6Z9PHP
	wXBjZp0kuTwKxb+4FK2FOCwayVIyyefRfe60i8At0XS8jyuFh/5pA0lo04opP/ZGgM8aNPHmB3P
	2LarSjdU3JuYobMHU+sRilMAhYkmx6nDym690g5UBXw==
X-Gm-Gg: AeBDieum7rcuv5+fj0TpSZ6PLUDLKRVimeHUVR+nDMQAZ4VVMzPACBAcfaNQI8yYMM0
	sL+6sDA6BmGDGiGANh8/v9SKmUiqGHlX/Qxv8Sssfibv9ushzq4x2rZeMDFJ8xYp0/XMcv38/s9
	5+C7+P1ZWFm94uYuI+ByAIr90ypHeII1CTa4gTZY+kWqwJGxPSao7lNL+i9+6r98RWXhEmqSZUV
	K8Xmw343VHULRFhfmSG7X1ErNMl/PwVu4EhjEa1qc+UpA1Vrj0P4Wk71/2LeRC2O60NYU4hxrhj
	8ry5e10W34RmGnm74Hmpc0pCCVDrT8oXMFM+dGlW
X-Received: by 2002:a05:6512:3c81:b0:5a3:d175:7f8a with SMTP id
 2adb3069b0e04-5a3e7a2c82bmr993816e87.19.1775729120838; Thu, 09 Apr 2026
 03:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212092846.61602-1-marco.crivellari@suse.com>
In-Reply-To: <20260212092846.61602-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 9 Apr 2026 12:05:08 +0200
X-Gm-Features: AQROBzAQ34LXdgUYfmjmLPNoOBwz1BqHy26GIoCTy-sn_p2WMOp5xKEeBtQqUj4
Message-ID: <CAAofZF7_6zg0F=Ki=8UCttsOEDTjD3sH8p3m7ZoCyusDGRWLQw@mail.gmail.com>
Subject: Re: [PATCH v2] media: synopsys: hdmirx: replace use of
 system_unbound_wq with system_dfl_wq
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,collabora.com];
	TAGGED_FROM(0.00)[bounces-58323-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1EFB13C9016
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 12, 2026 at 10:28=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Hi,

Gentle ping.

Thanks!

--=20

Marco Crivellari

SUSE Labs

