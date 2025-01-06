Return-Path: <linux-media+bounces-24280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74CDA026D2
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47E503A403D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 13:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F311DE2B7;
	Mon,  6 Jan 2025 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Akfrpqpq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD41DE2AE
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170812; cv=none; b=GbasBByX3pr/Vcl2g9isPjDg6QtAZiqW2wxSZZGtCPqC2koZ9LvuFfmCfRR9BSmm187MP9N/jMKHAAOwuIh/F64AP4Uh3YgvtjznvEoLFPXaY8saWDqq84cwqz+hWIcH3IwtaIoxCnx3KjahmDtZAKGhR4NcDK/F72UQ9fq5CTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170812; c=relaxed/simple;
	bh=/HaOC0UQuUCRG7UtKoSrqnIxQLLgF8uNCr3tEiNAggM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m36XGjRwQcnLW69cwHfWWgvo+lCRL0W0U4vZhS8RIvF82CV2be6YF/nwj1e10rf2rtQMNqwJyXKrDQdZNvjEgy+B74RdDS3sH6UZO2wCAbNelzt9ujthoQQpRmiOAPGbk8YFJBBQa9y7TOE8BeOgjFvubaPtruUlRK7bSIgwQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Akfrpqpq; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-46792996074so141381181cf.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 05:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736170810; x=1736775610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwdwuAkwGCHw83yVS+OBZ5UTbtgtyF3XHLP2TniQ+hw=;
        b=AkfrpqpqFkO9oYZ8EYkAjIdvYTBAZS8RS6VjxAJV5+HAulLkuQM0eWq4+GwaEll40a
         AphnfeHRT52gMbNs2fGLn2YH2c+zJpGEiz7HEXDlBhKpfNPgFFn6KE9/Neyvyjj2GHry
         L3lLFHXzz/486wxAb9TzEqzQzovowwV9tsgtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170810; x=1736775610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwdwuAkwGCHw83yVS+OBZ5UTbtgtyF3XHLP2TniQ+hw=;
        b=csC5kZJebL7rQLX/y6KFc/RRe+wMlsNjyTPAlaCcPihYJm6H2o8ggBYbkH2kSiDJJl
         JqfCsGbb4YksqfM7H4ahW2vwGbZMCuRlprMJMMw6IVuwowxGntqRWRy9puwG3Tmda0pn
         NVfKivDyb1QC/42zx9v1P63hGX7SnMn0Hn2zIthJLzjssA57EF1b8gWsUbH0TxslYTlF
         zNElWJGwRrI8bpYt7e9x7Xyq9QgleMUITZ54fhDzXyF8nO9Ie3pYTjnpdhyXJejlwJET
         DzBQs8Id19NnjKCzqiYYDp0SUsPm4/1qTFpmdNH+A06XVw6Iwvt6VjU/wVoT1zELt6eY
         IwJg==
X-Gm-Message-State: AOJu0Yz1yWPCIywnJJTWHchYO1TdDG3KhlDHgGR9efiNWUMaWb20ohVw
	JyYqU0eVRaV+Kr+9nqsPHX4Z3slhDNuF5km5/Z/23eIg3jIUvRAAGS95qxomMQ==
X-Gm-Gg: ASbGncs/2jAkFMfjCb9BsR0vx+WnhV7+cWfuPYLBf/dkn7ACAJHL9pgxoj68p+UAYUe
	XEPaooxxv51S7bcUApCiXctaW42ZqY2q5DsIs05E9vBzO/j1LOmU1DWOUnuWh+61VA+OqCgAK/p
	1wIQM5JV+P0I1k0MoWCdq71KlZW1eJcyB34pJQ4JWK5o2QlcT7cRFIZGFLf7Tm4jUCwuKqVYzhs
	Ex8JxnOD6xHnJCnoH0iNF4+48tBTuAVSkIA1lsU/VoQROg+jP052Jg6SZB8n7Hq+VjeoA65j/dc
	+ZBMSbgL91EPtKviY4UCgN5Fvef2RW+xrAsD
X-Google-Smtp-Source: AGHT+IEn5Ou8N6A5ZuxRVWPs80QvCQAMfXcoa0B7FLd71FuJaMTg55qppld2zbRIfvJF/yb+Z4SD8w==
X-Received: by 2002:a05:622a:54e:b0:467:6941:4ecc with SMTP id d75a77b69052e-46a4a977daemr1272210731cf.39.1736170809768;
        Mon, 06 Jan 2025 05:40:09 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d35sm1501861085a.90.2025.01.06.05.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:40:09 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 Jan 2025 13:40:07 +0000
Subject: [PATCH v4 1/6] media: dvb-frontends: tda10048: Make the range of z
 explicit.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-fix-cocci-v4-1-3c8eb97995ba@chromium.org>
References: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
In-Reply-To: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

We have not been able to find the relevant datahsheet, but it seems rare
that the device will have a sampling frequency over 613MHz.

Nonetheless, this patch does not introduce any change in behaviour, it
just adds a comment to make explicit the current limit: div by 32 bits.

Found by cocci:
drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda10048.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 3e725cdcc66b..1886f733dbbf 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 			     u32 bw)
 {
 	struct tda10048_state *state = fe->demodulator_priv;
-	u64 t, z;
+	u32 z;
+	u64 t;
 
 	dprintk(1, "%s()\n", __func__);
 
@@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 	/* t *= 2147483648 on 32bit platforms */
 	t *= (2048 * 1024);
 	t *= 1024;
+	/* Sample frequency is under 613MHz */
 	z = 7 * sample_freq_hz;
 	do_div(t, z);
 	t += 5;

-- 
2.47.1.613.gc27f4b7a9f-goog


