Return-Path: <linux-media+bounces-31150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FBA9EA73
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 10:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27407174A81
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 08:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A3D21CA14;
	Mon, 28 Apr 2025 08:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWdLVnC4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B5C2010F6
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828103; cv=none; b=Zg4v7JpBWK5TXWM0+Pf41GNbgZab5p6hwztYn/3Lx01QzmduN/ol7w/qdRiYgaCznsolcvaym9Kjrj1P+/dlk1MtSQiuYyGJVw+LzU65wiy9uBVoaGxRHExqnYjn1kJw4F5JVtHE74tI0ncMEGNjWE6t+RN+AoP76KjrMdsv+4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828103; c=relaxed/simple;
	bh=smaZaaYoXzeniFwBXuqTrpZ3qBD+3RZvqsIZoPcBYnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlZr9W5x3WO768aM/XRuWmwou/CQ5PSPgatlLSlFDfi0kKLajuzOI6svrT12thrhosApyOsfVoF7gznzHhWK7uOHjrf8k5lmT7ADKP+hE4w3y6ONmtx1ZuV/Twp+pvQBBuCfiTsKsuOYMUGOkYdBQ0xxyHeK4k1+bEWMgB5mxvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWdLVnC4; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2cc82edcf49so958262fac.1
        for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 01:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745828101; x=1746432901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjLKLWPVIix6Lq3CRuHZgmalj80BDZ10wGlvfmzu2jw=;
        b=mWdLVnC4WqsrYWdgWZrmaZ4wvVTatWAYap5JTfjYcKv3CTzmOaXXcqbflnltrnZviB
         e5q63O/BXVPaTxfJxVYP4JbLnq7noTOB6UUm11jQA+3oBT9Wmp2mwHLkmIw3PrczjpPq
         xzynZASE90PFw6Br9wdE0gx5AwxX8cubnkjC8CnV5jD5eMuiy0L4hBJJM5mwhRf7DsHJ
         p7TrLZQHL3HxNg1rhEPGUuHKuXeQnkUWje4VI8SP2x60ssvmuaDuQY4e/NuTmsvbSL8K
         kIQdzICMt6T7uYIaX7Nl88MYhKCJeMhh+iG04iS/+svPhR1C0SNn8KkHyzi+UgmhE2Iv
         iMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745828101; x=1746432901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjLKLWPVIix6Lq3CRuHZgmalj80BDZ10wGlvfmzu2jw=;
        b=YobLn+kZFRUF1qZm/0zOf52BnELoMhgSoITpJpjpnepusOGY2xUe5TsKjPOZ6lAyOv
         kd8A9ccbrGG+KmADTrwoAI1cOQXlEqJMUj1bpHeypEWtD4KPZt/X8glSKEXYhVVW7xdz
         pRm2UXKvd+yT2ANuEYxlUA0sfTWvzJg/EFkewon+HYF2++PGIuO1+Gg76rLr+eEZIC0M
         ZrJ7We5urqoS6yn3jO0lZb6y8WoFx43KHymTHNqYQqEQIoAk4gFfp1Nwyr/TAM+mjmz2
         y2MYp6+i3A0tfdHsKoW4RQbX3gdivfjWeef2STiwq2YdjiG1FO2G7iwq4O2WhP34Lrfn
         TX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVD+qCcl3wn36Mvl1lXle3cJLSGoQpoDTWYMAMVMygn2K99VCF7lrp4Zzk0AE/FjX8kv3f6odu9VZTZNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYJaXPlSjKiSc+ETP7uZPCBLY3kyh2JS9cb9PsTxDXULb1l7o
	BU6bhP0IMFIEwboDAGXwsaxA8cDbGk7Q0oT+VwZEizXhWP6eqExPyE3AIwEEmytH8TLQbr6f5p0
	BLSWkaHWvhnluj3TmhkG1bxXpOqB/BVmfsToBnw==
X-Gm-Gg: ASbGncumjhMJL+HmeRdNUQV3newtXaft+5gR1gg78X00yd8gEp1t52Xc4mOMQ57lmKa
	/TT6+SDy8c8tRLjr2r1FgK6VhuPKC2b6K/kD408fmUR2siyscIPexjfK5y/Po5CE8QVjkI2w+RB
	2aX/KxkjxbjAJVQlpdghkXKDc=
X-Google-Smtp-Source: AGHT+IEWtlpQOJjftCm+n3ouabVHz54n2qgyLCvi3RwihIEpBbgC5PkDIay7d9OERLr+OtQPUr9HF2lFg7zlk9MOBYo=
X-Received: by 2002:a05:6870:890a:b0:29e:6547:bffa with SMTP id
 586e51a60fabf-2d9be5c5aa0mr4238130fac.21.1745828100541; Mon, 28 Apr 2025
 01:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
 <20250404143215.2281034-5-jens.wiklander@linaro.org> <CAK8z29XHZXo5e1u8q_0D=iWxr3V2m7PateRGgqVGFe-WDeFKGg@mail.gmail.com>
In-Reply-To: <CAK8z29XHZXo5e1u8q_0D=iWxr3V2m7PateRGgqVGFe-WDeFKGg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 28 Apr 2025 10:14:48 +0200
X-Gm-Features: ATxdqUH0di-vJZcwSmU7RTw4PhvgopuZ5ILZgAWtuzUvUa846pxVI0QQshePM40
Message-ID: <CAHUa44GFFUAPRSDUzp-LJ8DZgsbAzNs3ZueA3wkePP4zqG9Z3A@mail.gmail.com>
Subject: Re: [PATCH v7 04/11] optee: sync secure world ABI headers
To: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rouven,

On Fri, Apr 25, 2025 at 3:36=E2=80=AFPM Rouven Czerwinski
<rouven.czerwinski@linaro.org> wrote:
>
> Hi,
>
> On Fri, 4 Apr 2025 at 16:31, Jens Wiklander <jens.wiklander@linaro.org> w=
rote:
> >
> > Update the header files describing the secure world ABI, both with and
> > without FF-A. The ABI is extended to deal with protected memory, but as
> > usual backward compatible.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/optee_ffa.h | 27 +++++++++---
> >  drivers/tee/optee/optee_msg.h | 83 ++++++++++++++++++++++++++++++-----
> >  drivers/tee/optee/optee_smc.h | 71 +++++++++++++++++++++++++++++-
> >  3 files changed, 163 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ff=
a.h
> > index 257735ae5b56..cc257e7956a3 100644
> > --- a/drivers/tee/optee/optee_ffa.h
> > +++ b/drivers/tee/optee/optee_ffa.h
> > @@ -81,7 +81,7 @@
> >   *                   as the second MSG arg struct for
> >   *                   OPTEE_FFA_YIELDING_CALL_WITH_ARG.
> >   *        Bit[31:8]: Reserved (MBZ)
> > - * w5:   Bitfield of secure world capabilities OPTEE_FFA_SEC_CAP_* bel=
ow,
> > + * w5:   Bitfield of OP-TEE capabilities OPTEE_FFA_SEC_CAP_*
> >   * w6:   The maximum secure world notification number
> >   * w7:   Not used (MBZ)
> >   */
> > @@ -94,6 +94,8 @@
> >  #define OPTEE_FFA_SEC_CAP_ASYNC_NOTIF  BIT(1)
> >  /* OP-TEE supports probing for RPMB device if needed */
> >  #define OPTEE_FFA_SEC_CAP_RPMB_PROBE   BIT(2)
> > +/* OP-TEE supports Protected Memory for secure data path */
> > +#define OPTEE_FFA_SEC_CAP_PROTMEM      BIT(3)
> >
> >  #define OPTEE_FFA_EXCHANGE_CAPABILITIES OPTEE_FFA_BLOCKING_CALL(2)
> >
> > @@ -108,7 +110,7 @@
> >   *
> >   * Return register usage:
> >   * w3:    Error code, 0 on success
> > - * w4-w7: Note used (MBZ)
> > + * w4-w7: Not used (MBZ)
> >   */
> >  #define OPTEE_FFA_UNREGISTER_SHM       OPTEE_FFA_BLOCKING_CALL(3)
> >
> > @@ -119,16 +121,31 @@
> >   * Call register usage:
> >   * w3:    Service ID, OPTEE_FFA_ENABLE_ASYNC_NOTIF
> >   * w4:   Notification value to request bottom half processing, should =
be
> > - *       less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE.
> > + *       less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE
> >   * w5-w7: Not used (MBZ)
> >   *
> >   * Return register usage:
> >   * w3:    Error code, 0 on success
> > - * w4-w7: Note used (MBZ)
> > + * w4-w7: Not used (MBZ)
> >   */
> >  #define OPTEE_FFA_ENABLE_ASYNC_NOTIF   OPTEE_FFA_BLOCKING_CALL(5)
> >
> > -#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE 64
> > +#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE        64
> > +
> > +/*
> > + * Release Protected memory
> > + *
> > + * Call register usage:
> > + * w3:    Service ID, OPTEE_FFA_RECLAIM_PROTMEM
> > + * w4:    Shared memory handle, lower bits
> > + * w5:    Shared memory handle, higher bits
> > + * w6-w7: Not used (MBZ)
> > + *
> > + * Return register usage:
> > + * w3:    Error code, 0 on success
> > + * w4-w7: Note used (MBZ)
> > + */
> > +#define OPTEE_FFA_RELEASE_PROTMEM      OPTEE_FFA_BLOCKING_CALL(8)
> >
> >  /*
> >   * Call with struct optee_msg_arg as argument in the supplied shared m=
emory
> > diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_ms=
g.h
> > index e8840a82b983..22d71d6f110d 100644
> > --- a/drivers/tee/optee/optee_msg.h
> > +++ b/drivers/tee/optee/optee_msg.h
> > @@ -133,13 +133,13 @@ struct optee_msg_param_rmem {
> >  };
> >
> >  /**
> > - * struct optee_msg_param_fmem - ffa memory reference parameter
> > + * struct optee_msg_param_fmem - FF-A memory reference parameter
> >   * @offs_lower:           Lower bits of offset into shared memory refe=
rence
> >   * @offs_upper:           Upper bits of offset into shared memory refe=
rence
> >   * @internal_offs: Internal offset into the first page of shared memor=
y
> >   *                reference
> >   * @size:         Size of the buffer
> > - * @global_id:    Global identifier of Shared memory
> > + * @global_id:    Global identifier of the shared memory
> >   */
> >  struct optee_msg_param_fmem {
> >         u32 offs_low;
> > @@ -165,7 +165,7 @@ struct optee_msg_param_value {
> >   * @attr:      attributes
> >   * @tmem:      parameter by temporary memory reference
> >   * @rmem:      parameter by registered memory reference
> > - * @fmem:      parameter by ffa registered memory reference
> > + * @fmem:      parameter by FF-A registered memory reference
> >   * @value:     parameter by opaque value
> >   * @octets:    parameter by octet string
> >   *
> > @@ -296,6 +296,18 @@ struct optee_msg_arg {
> >   */
> >  #define OPTEE_MSG_FUNCID_GET_OS_REVISION       0x0001
> >
> > +/*
> > + * Values used in OPTEE_MSG_CMD_LEND_PROTMEM below
> > + * OPTEE_MSG_PROTMEM_RESERVED          Reserved
> > + * OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY Secure Video Playback
> > + * OPTEE_MSG_PROTMEM_TRUSTED_UI                Trused UI
> > + * OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD       Secure Video Recording
> > + */
> > +#define OPTEE_MSG_PROTMEM_RESERVED             0
> > +#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY    1
> > +#define OPTEE_MSG_PROTMEM_TRUSTED_UI           2
> > +#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD  3
> > +
> >  /*
> >   * Do a secure call with struct optee_msg_arg as argument
> >   * The OPTEE_MSG_CMD_* below defines what goes in struct optee_msg_arg=
::cmd
> > @@ -337,15 +349,62 @@ struct optee_msg_arg {
> >   * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF informs secure world that from now i=
s
> >   * normal world unable to process asynchronous notifications. Typicall=
y
> >   * used when the driver is shut down.
> > + *
> > + * OPTEE_MSG_CMD_LEND_PROTMEM lends protected memory. The passed norma=
l
> > + * physical memory is protected from normal world access. The memory
> > + * should be unmapped prior to this call since it becomes inaccessible
> > + * during the request.
> > + * Parameters are passed as:
> > + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> > + * [in] param[0].u.value.a             OPTEE_MSG_PROTMEM_* defined abo=
ve
> > + * [in] param[1].attr                  OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
> > + * [in] param[1].u.tmem.buf_ptr                physical address
> > + * [in] param[1].u.tmem.size           size
> > + * [in] param[1].u.tmem.shm_ref                holds protected memory =
reference
> > + *
> > + * OPTEE_MSG_CMD_RECLAIM_PROTMEM reclaims a previously lent protected
> > + * memory reference. The physical memory is accessible by the normal w=
orld
> > + * after this function has return and can be mapped again. The informa=
tion
> > + * is passed as:
> > + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> > + * [in] param[0].u.value.a             holds protected memory cookie
> > + *
> > + * OPTEE_MSG_CMD_GET_PROTMEM_CONFIG get configuration for a specific
> > + * protected memory use case. Parameters are passed as:
> > + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INOUT
> > + * [in] param[0].value.a               OPTEE_MSG_PROTMEM_*
> > + * [in] param[1].attr                  OPTEE_MSG_ATTR_TYPE_{R,F}MEM_OU=
TPUT
> > + * [in] param[1].u.{r,f}mem            Buffer or NULL
> > + * [in] param[1].u.{r,f}mem.size       Provided size of buffer or 0 fo=
r query
> > + * output for the protected use case:
> > + * [out] param[0].value.a              Minimal size of protected memor=
y
> > + * [out] param[0].value.b              Required alignment of size and =
start of
> > + *                                     protected memory
> > + * [out] param[1].{r,f}mem.size                Size of output data
> > + * [out] param[1].{r,f}mem             If non-NULL, contains an array =
of
> > + *                                     uint16_t holding endpoints that
> > + *                                     must be included when lending
> > + *                                     memory for this use case
> > + *
> > + * OPTEE_MSG_CMD_ASSIGN_PROTMEM assigns use-case to protected memory
> > + * previously lent using the FFA_LEND framework ABI. Parameters are pa=
ssed
> > + * as:
> > + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> > + * [in] param[0].u.value.a             holds protected memory cookie
> > + * [in] param[0].u.value.b             OPTEE_MSG_PROTMEM_* defined abo=
ve
> >   */
> > -#define OPTEE_MSG_CMD_OPEN_SESSION     0
> > -#define OPTEE_MSG_CMD_INVOKE_COMMAND   1
> > -#define OPTEE_MSG_CMD_CLOSE_SESSION    2
> > -#define OPTEE_MSG_CMD_CANCEL           3
> > -#define OPTEE_MSG_CMD_REGISTER_SHM     4
> > -#define OPTEE_MSG_CMD_UNREGISTER_SHM   5
> > -#define OPTEE_MSG_CMD_DO_BOTTOM_HALF   6
> > -#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF 7
> > -#define OPTEE_MSG_FUNCID_CALL_WITH_ARG 0x0004
> > +#define OPTEE_MSG_CMD_OPEN_SESSION             0
> > +#define OPTEE_MSG_CMD_INVOKE_COMMAND           1
> > +#define OPTEE_MSG_CMD_CLOSE_SESSION            2
> > +#define OPTEE_MSG_CMD_CANCEL                   3
> > +#define OPTEE_MSG_CMD_REGISTER_SHM             4
> > +#define OPTEE_MSG_CMD_UNREGISTER_SHM           5
> > +#define OPTEE_MSG_CMD_DO_BOTTOM_HALF           6
> > +#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF         7
> > +#define OPTEE_MSG_CMD_LEND_PROTMEM             8
> > +#define OPTEE_MSG_CMD_RECLAIM_PROTMEM          9
> > +#define OPTEE_MSG_CMD_GET_PROTMEM_CONFIG       10
> > +#define OPTEE_MSG_CMD_ASSIGN_PROTMEM           11
> > +#define OPTEE_MSG_FUNCID_CALL_WITH_ARG         0x0004
> >
> >  #endif /* _OPTEE_MSG_H */
> > diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_sm=
c.h
> > index 879426300821..b17e81f464a3 100644
> > --- a/drivers/tee/optee/optee_smc.h
> > +++ b/drivers/tee/optee/optee_smc.h
> > @@ -264,7 +264,6 @@ struct optee_smc_get_shm_config_result {
> >  #define OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM    BIT(0)
> >  /* Secure world can communicate via previously unregistered shared mem=
ory */
> >  #define OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM     BIT(1)
> > -
> >  /*
> >   * Secure world supports commands "register/unregister shared memory",
> >   * secure world accepts command buffers located in any parts of non-se=
cure RAM
> > @@ -280,6 +279,10 @@ struct optee_smc_get_shm_config_result {
> >  #define OPTEE_SMC_SEC_CAP_RPC_ARG              BIT(6)
> >  /* Secure world supports probing for RPMB device if needed */
> >  #define OPTEE_SMC_SEC_CAP_RPMB_PROBE           BIT(7)
> > +/* Secure world supports protected memory */
> > +#define OPTEE_SMC_SEC_CAP_PROTMEM              BIT(8)
> > +/* Secure world supports dynamic protected memory */
> > +#define OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM      BIT(9)
> >
> >  #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES 9
> >  #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
> > @@ -451,6 +454,72 @@ struct optee_smc_disable_shm_cache_result {
> >
> >  /* See OPTEE_SMC_CALL_WITH_REGD_ARG above */
> >  #define OPTEE_SMC_FUNCID_CALL_WITH_REGD_ARG    19
> > +/*
> > + * Get protected memory config
> > + *
> > + * Returns the protected memory config.
> > + *
> > + * Call register usage:
> > + * a0   SMC Function ID, OPTEE_SMC_GET_PROTMEM_CONFIG
> > + * a2-6        Not used, must be zero
> > + * a7  Hypervisor Client ID register
> > + *
> > + * Have config return register usage:
> > + * a0  OPTEE_SMC_RETURN_OK
> > + * a1  Physical address of start of protected memory
> > + * a2  Size of protected memory
> > + * a3  Not used
> > + * a4-7        Preserved
> > + *
> > + * Not available register usage:
> > + * a0  OPTEE_SMC_RETURN_ENOTAVAIL
> > + * a1-3 Not used
> > + * a4-7        Preserved
> > + */
> > +#define OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG            20
> > +#define OPTEE_SMC_GET_PROTMEM_CONFIG \
> > +       OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG)
> > +
> > +struct optee_smc_get_protmem_config_result {
> > +       unsigned long status;
> > +       unsigned long start;
> > +       unsigned long size;
> > +       unsigned long flags;
>
> The ABI comment does not document a flags return argument, either
> this can be removed or the ABI comment needs to be fixed.

Sure, I'll remove the field.

> Same for
> > +};
> > +
> > +/*
> > + * Get dynamic protected memory config
> > + *
> > + * Returns the dynamic protected memory config.
> > + *
> > + * Call register usage:
> > + * a0  SMC Function ID, OPTEE_SMC_GET_DYN_SHM_CONFIG
>
> should be OPTEE_SMC_GET_DYN_PROTMEM_CONFIG

Thanks, I'll update.

>
> > + * a2-6        Not used, must be zero
> > + * a7  Hypervisor Client ID register
> > + *
> > + * Have config return register usage:
> > + * a0  OPTEE_SMC_RETURN_OK
> > + * a1  Minamal size of protected memory
>
> Nit: Typo, should be "Minimal"

Yes, I'll update.

Cheers,
Jens

>
> > + * a2  Required alignment of size and start of registered protected me=
mory
> > + * a3  Not used
> > + * a4-7        Preserved
> > + *
> > + * Not available register usage:
> > + * a0  OPTEE_SMC_RETURN_ENOTAVAIL
> > + * a1-3 Not used
> > + * a4-7        Preserved
> > + */
> > +
> > +#define OPTEE_SMC_FUNCID_GET_DYN_PROTMEM_CONFIG        21
> > +#define OPTEE_SMC_GET_DYN_PROTMEM_CONFIG \
> > +       OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_DYN_PROTMEM_CONFIG=
)
> > +
> > +struct optee_smc_get_dyn_protmem_config_result {
> > +       unsigned long status;
> > +       unsigned long size;
> > +       unsigned long align;
> > +       unsigned long flags;
> > +};
> >
> >  /*
> >   * Resume from RPC (for example after processing a foreign interrupt)
> > --
> > 2.43.0
>
> - Rouven

