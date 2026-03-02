Return-Path: <linux-media+bounces-54083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPZsCdFwpWlXAgYAu9opvQ
	(envelope-from <linux-media+bounces-54083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 12:13:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D6A1D7468
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 12:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FA82305A43A
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 11:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8958935FF5B;
	Mon,  2 Mar 2026 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDt4QIf8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D083603C3
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449889; cv=none; b=EKZTddclfv+SK7c5xLcEiLxknXrvRcWN5mr8m83t1BwQYk9LICuehF2oPOKZdXWlBPLJ5HcS7qI0OLI8Du1O+qj7HX8/oLWPDLvVQr4L2MqgP8e4veGYkFKHI2cVdu9gK1dC391pBc5kmLzlGDEeIEJlgRrJfVaoPv3uldZ1BCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449889; c=relaxed/simple;
	bh=HGgtlMxxZdZuCnKnB6HC39ylIsRD4qzKVesV+JA1mbY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bXHIpfP/308+jULSZFnTo1wHnx+utE2IMWc4UquEr1GTNs9wOLbYbLpxxcuk/pO57//fVb29NRvrPcQxvtVyJBMnLKG2MKy9+3MVobKjEDcmG7w3X8i4czbntXNf2xPqhkHaZLVgAB5Wm5Y8+umAh/fLp1UQfh4rmo2kEt+t7No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDt4QIf8; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65bf2f59d64so5424607a12.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 03:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449886; x=1773054686; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGgtlMxxZdZuCnKnB6HC39ylIsRD4qzKVesV+JA1mbY=;
        b=SDt4QIf88KTFPb541m9HR5MVpYw7fn6bFQ0ZAHeA0kdWktq+BWVNJViO3HuMwOBsvw
         S9LHS/FVgp82YCQs1sqXIxgvUFBQg4Ufk6bqOr8r7KvkhWCv9wMwCMqfQPrZ7Aza/UdS
         RTyFhBnLiZK0hMi97+tc2QLiPBdYg49pNZct11I7jmlKRmjbqLPNBC8S8eXKwhUF/UdZ
         2K4dLhY1v/oqu/HDYjpnRhvbIn+5mXxdXHwbLxn+O4a8ER8JhEoKhxs5JeEKOxFcqldz
         0VG6hQ/rJdIRlhl768bxFZj1i2HX/s8A0sQ46WrfedRZLonkAvZZK+P6pLKj3SKVWoFx
         ffNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449886; x=1773054686;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGgtlMxxZdZuCnKnB6HC39ylIsRD4qzKVesV+JA1mbY=;
        b=iUZZKjAOf2FGeOiUuSH9pTOBYGzN9E5v+0VZhZsaaWhI7SSCX3m4t9IOKVeY51Pgh2
         VEpIt+MofV1yKFjPaVWHnBZ7o2Gcg1bB/NwNoZOvAiJR+VwN9gHz/+XUPfl7kFwZhEDd
         5L87hubhG2wNMe8z9E5yvBh+On1+0fNYqJc5tUZX0kDeMolKg1kcQ7HgIO7zOFaa4i9/
         kva/74+cUVu3zWWhV/MeVdKTZjc3xoTJXboy6TNdDyDg41Qcx5Cbq7vuKmIe4f31LmCk
         XSuyi8Q7t4vrPvfc8d9E1Cn2T5yG3Ea8Ds6d+xXRCmL1AZEsBACcTuHLX+rvSwB2VEb/
         hMhw==
X-Forwarded-Encrypted: i=1; AJvYcCVCoq64A39bzhVjc4cIvQpQd1NTPE1JCtftDQqM8L+lfLLXKsz3tWWzyLVXJoOLw2KDuLDDWs0ch8wjJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx1yTDtYs4DpgOi1XVk0sWRakyx5yI6lCjmickglhZr518In2L
	bz+atKzncq3aS9LQIb+isiDnx4JadocSHtwAHs3EjZ+qb9X2Q2VBJdsX
X-Gm-Gg: ATEYQzzTttSUFe973T92ANkQEv6iTmQe7m7s1sBhR+5Dx+N3IgaOxTFVWh+ytGqxbTz
	5AqZZlLl2LWfIvSP4vroay3UnRpKsWdjsr3lruX/9WpVW6d9PF7AiKPrCexsq7UBdGhgMxfjJ17
	9SjtjYw7Ol0UpFkc9fZIDXiXzd4o8QXfsf6QQSj0h/9vuGb+fDlWCtCcIE5SnFL5PbbCYGPrsjq
	1o5hh+vOrhHDp5zKNitXJO8krit4AwMIaZbZRh+2uMhftZuvPNJnlK5UGMt8xKGUsT9mC7pH78O
	nO8tqPHdiOJK0jyTI6g688MJC8nNZKOrHZLDlRVEc5QgxaDF6+A6FwjCqQEYrGE/l8aXXVJFj8y
	kZzpu+IsdIxTT+i4jCXqkE7YWE+MYd8ldCaL0jlcgehq7Xc7KLroRW0pIYre0+ZH1CPP6CG/ADs
	DLXvpnoUB282ju0flAax+uX79h24xw+uHW6K89KydZZuSO9qgsbAZACcZZWublPuW3xvywPJceq
	1ELX6XFaWd3vNe3CnoVcho5B2zxFlBpaqxOSkvOEAK+4Z39G8oMtkH7AqcVru4knQ==
X-Received: by 2002:a05:6402:1455:b0:64d:2920:ef29 with SMTP id 4fb4d7f45d1cf-65fdd4cc71dmr6935024a12.2.1772449885969;
        Mon, 02 Mar 2026 03:11:25 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06e299sm3311350a12.26.2026.03.02.03.11.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:11:25 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] media: venus: allow interlaced video streams
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:11:14 +0100
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0884ABDD-8FE6-47CE-A8F4-C5F6061E0FE7@gmail.com>
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
 <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
 <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54083-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotroniszczuk@gmail.com,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: A9D6A1D7468
X-Rspamd-Action: no action



> Wiadomo=C5=9B=C4=87 napisana przez Vikash Garodia =
<vikash.garodia@oss.qualcomm.com> w dniu 2 mar 2026, o godz. 08:31:
>=20
>=20
> On 3/1/2026 4:05 AM, Dmitry Baryshkov wrote:
>>>=20
>>> br
>> Interesting. So, most likely, H.264 decoder can't cope with it and we
>> need to allow non-NONE fields only for MPEG2. Let's see if Vikash =
will
>> have any other ideas.
>=20
> Venus should already support h264 interlace.
>=20
> Piotr, do you see the same failure without this patch ?
>=20
> Regards,
> Vikash

yes


