Return-Path: <linux-media+bounces-19479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F199AFC8
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 02:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87CE01F245FD
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 00:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2112AD2FF;
	Sat, 12 Oct 2024 00:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IJdxsXHz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4789454
	for <linux-media@vger.kernel.org>; Sat, 12 Oct 2024 00:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728694392; cv=none; b=EMNDY/hnvVFU0cWYGg1eT16GJ2995LVnyNK5cZDpVKCoB2MkM+fBddxFpJZbECoTi0GxfNP1xt5iM9QQ1WWwzEujkyPqYbd31crvxzJjK8ZHBsk/hr8mCAIhDhvqx97QnCaeN4+JslyL27l0/y5MWVYBwpZiRqAFpvA9FSks8og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728694392; c=relaxed/simple;
	bh=VfzxJcYIuN/+o0Q6JREd/kmtpwVtgnQZC798v/gUM1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FaQa4SdZVU6qbtQbbmTF5g1Om05JONfizawMSbWkqjB7HdnNRJ/K7I3y6XvoO1697MEZH1CmyxzK4Vy/nPAVf2T3AkqRX7Jsx101x6SUfzOF0GRIA9uvrpxUmovMb/6Ac9rPPDm4wtV9M2PXqkuCt1SqTDImiVUBIgR+pVOdlxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IJdxsXHz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a997736106fso330641366b.3
        for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 17:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728694388; x=1729299188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fX8qbIl6yI0pe7Z7Ey3xMlNXl8QKMUUNG2vGHvdrAqQ=;
        b=IJdxsXHz59zzmtXWusVLQgiG7ttlMyeuLh/fNq977bXWYp9k8hRx4Xo22PPXtONPPG
         vO2dB2nIb9BIh7dcIqoujB4wcxVnC+KpTVR0ZqLfIIWkZvPeeIL1tTPkeFVx4gU0WBut
         CoLcv+bv3RWFSDFC/ST4pCOjk2YNvMsWWOk+60ivZG9bXBZ0v0HaPT5Zxrj/gfEtzkCa
         uDFSSDCQsV9MNuZCemWeq4FXB7q6E1OuW1ddD/vFIyKVvu4hd9jm4yU1JJxY5jgK74SA
         zl9XmctJQ/ILjy0vQNRyZMdFOtlopHT4oseAhkxFz5VwelQBVOyOhWLdKkJVxnGuu8Pm
         psrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728694388; x=1729299188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fX8qbIl6yI0pe7Z7Ey3xMlNXl8QKMUUNG2vGHvdrAqQ=;
        b=u8kwFw14IYmWtp94hzQk1J19r4v9jfSFddFDw5CmY35WvFpGu8iFC1vzM0P94grxKx
         1YZixtH9h/TPnEVvc05CWNHk8A5GyZ6xZJwdMxMbLx+rs/itOhtVPMFNnoVAzM6wA1qM
         JcmQkSv8unqVYYKKN3P7rqdgW3qda5m8kDoVnIn6Qu7S1YWdYUgoWAMZuW/m2cCI2j8D
         OTM48/5HthInNHkjyoSN+z/KokhfFV31z72yoEwLCs55hamwiSW/tIFB39uiD84vg0fr
         p6crjgPpb0TIuzlL7i6jid8174/DMPhjsHfdbyJDlqejw/8fs/qHqqpDPoJPipUM1kKM
         tPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWbwmuteM05Jg+SCGMDq9hCj9rRPSwx5WZrWpd4qG6B3I5cZoj4PP4PFlQd8HCKyt4UmRClAv4yRC7Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuwLdW1ZikYYpPREqEB/VPKUNLm989xOko/l5D9LU9LiBPzqjl
	Tq/MARI+WZRMBnmvmukbs+31Rbj8qQPRlJwuCx38h+hxAEIcXhOAjGdGHUuor6UaG2B4WZ199FF
	yUQM2Ftf6kL0OC78chs4hZqcCAx+byyu5yfw=
X-Google-Smtp-Source: AGHT+IHcGOMyjbUnqPtl1UM87h3YL87dZ2gYOIUO6wGlw/CCJ1mjQPIwZZ9PoqGjsv+QiY4iVj7yxWbnA0AL382mrFA=
X-Received: by 2002:a17:907:ea3:b0:a99:4e8c:e5c9 with SMTP id
 a640c23a62f3a-a99b937b7famr358020366b.20.1728694388307; Fri, 11 Oct 2024
 17:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005180955.6523-1-quic_pintu@quicinc.com>
In-Reply-To: <20241005180955.6523-1-quic_pintu@quicinc.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 11 Oct 2024 17:52:56 -0700
Message-ID: <CANDhNCpeJFn9NMQYwWT04x=HL2bUi71V6YpQG7Gg5PVVCbRfXw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: fix S_IRUGO to 0444, block comments, func declaration
To: Pintu Kumar <quic_pintu@quicinc.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, tjmercier@google.com, christian.koenig@amd.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, joe@perches.com, 
	skhan@linuxfoundation.org, pintu.ping@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 11:10=E2=80=AFAM Pintu Kumar <quic_pintu@quicinc.com=
> wrote:
>
> These warnings/errors are reported by checkpatch.
> Fix them with minor changes to make it clean.
> No other functional changes.
>
> WARNING: Block comments use * on subsequent lines
> +       /* only support discovering the end of the buffer,
> +          but also allow SEEK_SET to maintain the idiomatic
>
> WARNING: Block comments use a trailing */ on a separate line
> +          SEEK_END(0), SEEK_CUR(0) pattern */
>
> WARNING: Block comments use a trailing */ on a separate line
> +        * before passing the sgt back to the exporter. */
>
> ERROR: "foo * bar" should be "foo *bar"
> +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach=
,
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using=
 octal permissions '0444'.
> +       d =3D debugfs_create_file("bufinfo", S_IRUGO, dma_buf_debugfs_dir=
,
>
> total: 1 errors, 4 warnings, 1746 lines checked
>
> Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>

Looks ok to me. Thanks for sending these cleanups!
Acked-by: John Stultz <jstultz@google.com>

