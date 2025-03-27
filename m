Return-Path: <linux-media+bounces-28817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC263A72AB4
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 08:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 185CF1776D1
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 07:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52FA1FF7C3;
	Thu, 27 Mar 2025 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIXZ3t8u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1711FF7AD
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 07:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743061334; cv=none; b=HSvfnvydIUdb2Yhij3eX99tdK5pUEF/7KBGrzsFVefv0hbb4bgcbHu5CjuPwSrAG1r5/RgHjpmGftO7CmceJDnGzrVPC/MT0/UuTc7jX99rX64JgbMyDLi6aF1S3ZsrZP7KHxPTAmqgSq2HyOdvx6VCEFjfqQnnWbtm1dsdR4VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743061334; c=relaxed/simple;
	bh=9ekhHZ8ArIBsG5kEaVw4sPuSSUXxyahUNyAzfPUHTWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmIHQzV7l9uk666Zj1eLJspOqY5s+cBGlkRfQQ5GvvSeRysDWtyRSoC2BTSgGICVMlRImPCbQhd7ItMEPERG7B+m5cID+BzdvW1azoHNivNDrAmAHTiDsrzOAHuec5cJLJC4wPtS9+LYEry/SQlM2MbNFkyncj3bZhJJ/lZ8l5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIXZ3t8u; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2c7b2c14455so355823fac.2
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 00:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743061330; x=1743666130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Yz3GUX6XsM224gr6XKQEAgq589B/LL0UkQGjhjBGwI=;
        b=iIXZ3t8u6TwhD85ooUzBe0938m66C3X9/i066g0NhXQTG4aY1G8jbQi1HK4xF4ChBU
         LQedMHSb9keR6X+1gBXrvWgLUtACGiLEwm27qafthRsQ/LoG4f3uTVgLK4ub8QP7GZmi
         Y7oM19dUaHmXKSd2rBJnMbLbtgU65Oh4PfFo50LzKZQuxoDMKHRy0Qey0awVM7yOYBeO
         IKA+X+QLQYGQZuCJGDu/Lsq+sCI0U+mfDVMZugRpy2CsSop0WEGeEeRkRpMNRqsFJVUn
         zkbwTXgLwkBbcW5GN7Mrd0L9a0TxhL+7HGb2aLYhjBJE4xj78i8qUN2bAsbz/KLtPflw
         7HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743061330; x=1743666130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Yz3GUX6XsM224gr6XKQEAgq589B/LL0UkQGjhjBGwI=;
        b=evtY+JPnTBngWZpwTaBPs6YK3XRVVLsGjKzqVieJ+CWq5nAeBaTVG17HyleEkK6DpS
         evrf7R7mJI+wYrOlk2EnfNJqm/a8EyLqjSsEV8NKQGVUf3tL1k580qw/S7AdFAFWAgPx
         Nh1Y4BiGH0g/vtEUU7Uix8ZnikcfW1uZ4Ir5vlh40/LjVJiS1jaVum/cHdK8dhwsjPYf
         c2vrQHkzMfbPJgEjgQLZOQQjlf3ijUcTUpc6HH9OI/yDXf7yaFCAqoPsXg2Td2qaPFtd
         rYlRTLjRan4fQkNyXEjHMXkVA4N4onKLhG6Fh6RZApJCj2+3o6SpPIyLgJaI+PviB4Iu
         OpMw==
X-Forwarded-Encrypted: i=1; AJvYcCVf/z5ZoDIbGFlxiO4MvvJEQUL3E56IVWlPP9maeddG8jFDhwZmX/El79/D42X2N/3x99z5rgVExUGK3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhBFCo9Jt6UUtfa7tb6XU78/wH+T2kFCX3fH4MJEtvN1tlrltZ
	X5/EAdsmWyzNVNXJjuAns0QN9OIYhMer1sJuqHByLkPaOAVpcc9BkKY/otM79cVzKT/Lij2uKqt
	SWCGpoVodzTLCl749SkSuOqrLe2Om0YHaPKWIrQ==
X-Gm-Gg: ASbGncsA51bJHbwG8LcrQpIwcuBOy2XB7QVKNRFgCDPoZoXrqAXPE7hAAZkCGA1QjzD
	BxMimxHDan9XCemEll5WjBanjPG1pvhd87NDbIXC2QlFJbzk3J9pgEbLAHjD/f2+M6l4LPiODW0
	xWVgIESYdhiIfygaAaiIrUyhS3nUQ=
X-Google-Smtp-Source: AGHT+IEuzFu54ZYzJqGHEirIntYenIkcBiYp2Yxy6HHYV+YxvWp0YOkF2QHuz3j762PwgVE4Dt+Gh5t4pAIhKW2Kirw=
X-Received: by 2002:a05:6870:d3cb:b0:2b8:3c87:f36 with SMTP id
 586e51a60fabf-2c847f7ce6dmr1473724fac.13.1743061329469; Thu, 27 Mar 2025
 00:42:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-5-jens.wiklander@linaro.org> <Z-JLLHcrt1pwXe7J@sumit-X1>
In-Reply-To: <Z-JLLHcrt1pwXe7J@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 27 Mar 2025 08:41:58 +0100
X-Gm-Features: AQ5f1JpKpCaHnPq-WqpxZiMG9gvRuu0d1oZ8goQvglf9XAprpIT1EHtIU6jGLNc
Message-ID: <CAHUa44FO4NR90UsQQMNBC7n=4wE-bC+71OR5r7-gzFZBf+-76A@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] optee: sync secure world ABI headers
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sumit,

On Tue, Mar 25, 2025 at 7:20=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> Hi Jens,
>
> It has taken a bit of time for me to review this patch-set as I am
> settling in my new role.
>
> On Wed, Mar 05, 2025 at 02:04:10PM +0100, Jens Wiklander wrote:
> > Update the header files describing the secure world ABI, both with and
> > without FF-A. The ABI is extended to deal with restricted memory, but a=
s
> > usual backward compatible.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/optee_ffa.h | 27 ++++++++++---
> >  drivers/tee/optee/optee_msg.h | 65 ++++++++++++++++++++++++++++++--
> >  drivers/tee/optee/optee_smc.h | 71 ++++++++++++++++++++++++++++++++++-
> >  3 files changed, 154 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ff=
a.h
> > index 257735ae5b56..7bd037200343 100644
> > --- a/drivers/tee/optee/optee_ffa.h
> > +++ b/drivers/tee/optee/optee_ffa.h
> > @@ -81,7 +81,7 @@
> >   *                   as the second MSG arg struct for
> >   *                   OPTEE_FFA_YIELDING_CALL_WITH_ARG.
> >   *        Bit[31:8]: Reserved (MBZ)
> > - * w5:         Bitfield of secure world capabilities OPTEE_FFA_SEC_CAP=
_* below,
> > + * w5:         Bitfield of OP-TEE capabilities OPTEE_FFA_SEC_CAP_*
> >   * w6:         The maximum secure world notification number
> >   * w7:         Not used (MBZ)
> >   */
> > @@ -94,6 +94,8 @@
> >  #define OPTEE_FFA_SEC_CAP_ASYNC_NOTIF        BIT(1)
> >  /* OP-TEE supports probing for RPMB device if needed */
> >  #define OPTEE_FFA_SEC_CAP_RPMB_PROBE BIT(2)
> > +/* OP-TEE supports Restricted Memory for secure data path */
> > +#define OPTEE_FFA_SEC_CAP_RSTMEM     BIT(3)
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
> >  #define OPTEE_FFA_UNREGISTER_SHM     OPTEE_FFA_BLOCKING_CALL(3)
> >
> > @@ -119,16 +121,31 @@
> >   * Call register usage:
> >   * w3:    Service ID, OPTEE_FFA_ENABLE_ASYNC_NOTIF
> >   * w4:         Notification value to request bottom half processing, s=
hould be
> > - *     less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE.
> > + *     less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE
> >   * w5-w7: Not used (MBZ)
> >   *
> >   * Return register usage:
> >   * w3:    Error code, 0 on success
> > - * w4-w7: Note used (MBZ)
> > + * w4-w7: Not used (MBZ)
> >   */
> >  #define OPTEE_FFA_ENABLE_ASYNC_NOTIF OPTEE_FFA_BLOCKING_CALL(5)
> >
> > -#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE 64
> > +#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE      64
> > +
> > +/*
> > + * Release Restricted memory
> > + *
> > + * Call register usage:
> > + * w3:    Service ID, OPTEE_FFA_RECLAIM_RSTMEM
> > + * w4:    Shared memory handle, lower bits
> > + * w5:    Shared memory handle, higher bits
> > + * w6-w7: Not used (MBZ)
> > + *
> > + * Return register usage:
> > + * w3:    Error code, 0 on success
> > + * w4-w7: Note used (MBZ)
> > + */
> > +#define OPTEE_FFA_RELEASE_RSTMEM     OPTEE_FFA_BLOCKING_CALL(8)
> >
> >  /*
> >   * Call with struct optee_msg_arg as argument in the supplied shared m=
emory
> > diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_ms=
g.h
> > index e8840a82b983..1b558526e7d9 100644
> > --- a/drivers/tee/optee/optee_msg.h
> > +++ b/drivers/tee/optee/optee_msg.h
> > @@ -133,13 +133,13 @@ struct optee_msg_param_rmem {
> >  };
> >
> >  /**
> > - * struct optee_msg_param_fmem - ffa memory reference parameter
> > + * struct optee_msg_param_fmem - FF-A memory reference parameter
> >   * @offs_lower:         Lower bits of offset into shared memory refere=
nce
> >   * @offs_upper:         Upper bits of offset into shared memory refere=
nce
> >   * @internal_offs: Internal offset into the first page of shared memor=
y
> >   *              reference
> >   * @size:       Size of the buffer
> > - * @global_id:          Global identifier of Shared memory
> > + * @global_id:          Global identifier of the shared memory
> >   */
> >  struct optee_msg_param_fmem {
> >       u32 offs_low;
> > @@ -165,7 +165,7 @@ struct optee_msg_param_value {
> >   * @attr:    attributes
> >   * @tmem:    parameter by temporary memory reference
> >   * @rmem:    parameter by registered memory reference
> > - * @fmem:    parameter by ffa registered memory reference
> > + * @fmem:    parameter by FF-A registered memory reference
> >   * @value:   parameter by opaque value
> >   * @octets:  parameter by octet string
> >   *
> > @@ -296,6 +296,18 @@ struct optee_msg_arg {
> >   */
> >  #define OPTEE_MSG_FUNCID_GET_OS_REVISION     0x0001
> >
> > +/*
> > + * Values used in OPTEE_MSG_CMD_LEND_RSTMEM below
> > + * OPTEE_MSG_RSTMEM_RESERVED         Reserved
> > + * OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY        Secure Video Playback
> > + * OPTEE_MSG_RSTMEM_TRUSTED_UI               Trused UI
> > + * OPTEE_MSG_RSTMEM_SECURE_VIDEO_RECORD      Secure Video Recording
> > + */
> > +#define OPTEE_MSG_RSTMEM_RESERVED            0
> > +#define OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY   1
> > +#define OPTEE_MSG_RSTMEM_TRUSTED_UI          2
> > +#define OPTEE_MSG_RSTMEM_SECURE_VIDEO_RECORD 3
> > +
> >  /*
> >   * Do a secure call with struct optee_msg_arg as argument
> >   * The OPTEE_MSG_CMD_* below defines what goes in struct optee_msg_arg=
::cmd
> > @@ -337,6 +349,49 @@ struct optee_msg_arg {
> >   * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF informs secure world that from now i=
s
> >   * normal world unable to process asynchronous notifications. Typicall=
y
> >   * used when the driver is shut down.
> > + *
> > + * OPTEE_MSG_CMD_LEND_RSTMEM lends restricted memory. The passed norma=
l
> > + * physical memory is restricted from normal world access. The memory
> > + * should be unmapped prior to this call since it becomes inaccessible
> > + * during the request.
> > + * Parameters are passed as:
> > + * [in] param[0].attr                        OPTEE_MSG_ATTR_TYPE_VALUE=
_INPUT
> > + * [in] param[0].u.value.a           OPTEE_MSG_RSTMEM_* defined above
> > + * [in] param[1].attr                        OPTEE_MSG_ATTR_TYPE_TMEM_=
INPUT
> > + * [in] param[1].u.tmem.buf_ptr              physical address
> > + * [in] param[1].u.tmem.size         size
> > + * [in] param[1].u.tmem.shm_ref              holds restricted memory r=
eference
> > + *
> > + * OPTEE_MSG_CMD_RECLAIM_RSTMEM reclaims a previously lent restricted
> > + * memory reference. The physical memory is accessible by the normal w=
orld
> > + * after this function has return and can be mapped again. The informa=
tion
> > + * is passed as:
> > + * [in] param[0].attr                        OPTEE_MSG_ATTR_TYPE_VALUE=
_INPUT
> > + * [in] param[0].u.value.a           holds restricted memory cookie
> > + *
> > + * OPTEE_MSG_CMD_GET_RSTMEM_CONFIG get configuration for a specific
> > + * restricted memory use case. Parameters are passed as:
> > + * [in] param[0].attr                        OPTEE_MSG_ATTR_TYPE_VALUE=
_INOUT
> > + * [in] param[0].value.a             OPTEE_MSG_RSTMEM_*
> > + * [in] param[1].attr                        OPTEE_MSG_ATTR_TYPE_{R,F}=
MEM_OUTPUT
> > + * [in] param[1].u.{r,f}mem          Buffer or NULL
> > + * [in] param[1].u.{r,f}mem.size     Provided size of buffer or 0 for =
query
> > + * output for the restricted use case:
> > + * [out] param[0].value.a            Minimal size of SDP memory
> > + * [out] param[0].value.b            Required alignment of size and st=
art of
> > + *                                   restricted memory
> > + * [out] param[1].{r,f}mem.size              Size of output data
> > + * [out] param[1].{r,f}mem           If non-NULL, contains an array of
> > + *                                   uint16_t holding endpoints that
> > + *                                   must be included when lending
> > + *                                   memory for this use case
> > + *
> > + * OPTEE_MSG_CMD_ASSIGN_RSTMEM assigns use-case to restricted memory
> > + * previously lent using the FFA_LEND framework ABI. Parameters are pa=
ssed
> > + * as:
> > + * [in] param[0].attr                        OPTEE_MSG_ATTR_TYPE_VALUE=
_INPUT
> > + * [in] param[0].u.value.a           holds restricted memory cookie
> > + * [in] param[0].u.value.b           OPTEE_MSG_RSTMEM_* defined above
> >   */
> >  #define OPTEE_MSG_CMD_OPEN_SESSION   0
> >  #define OPTEE_MSG_CMD_INVOKE_COMMAND 1
> > @@ -346,6 +401,10 @@ struct optee_msg_arg {
> >  #define OPTEE_MSG_CMD_UNREGISTER_SHM 5
> >  #define OPTEE_MSG_CMD_DO_BOTTOM_HALF 6
> >  #define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF       7
> > +#define OPTEE_MSG_CMD_LEND_RSTMEM    8
> > +#define OPTEE_MSG_CMD_RECLAIM_RSTMEM 9
> > +#define OPTEE_MSG_CMD_GET_RSTMEM_CONFIG      10
> > +#define OPTEE_MSG_CMD_ASSIGN_RSTMEM  11
> >  #define OPTEE_MSG_FUNCID_CALL_WITH_ARG       0x0004
> >
> >  #endif /* _OPTEE_MSG_H */
> > diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_sm=
c.h
> > index 879426300821..abc379ce190c 100644
> > --- a/drivers/tee/optee/optee_smc.h
> > +++ b/drivers/tee/optee/optee_smc.h
> > @@ -264,7 +264,6 @@ struct optee_smc_get_shm_config_result {
> >  #define OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM  BIT(0)
> >  /* Secure world can communicate via previously unregistered shared mem=
ory */
> >  #define OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM   BIT(1)
> > -
> >  /*
> >   * Secure world supports commands "register/unregister shared memory",
> >   * secure world accepts command buffers located in any parts of non-se=
cure RAM
> > @@ -280,6 +279,10 @@ struct optee_smc_get_shm_config_result {
> >  #define OPTEE_SMC_SEC_CAP_RPC_ARG            BIT(6)
> >  /* Secure world supports probing for RPMB device if needed */
> >  #define OPTEE_SMC_SEC_CAP_RPMB_PROBE         BIT(7)
> > +/* Secure world supports Secure Data Path */
> > +#define OPTEE_SMC_SEC_CAP_SDP                        BIT(8)
> > +/* Secure world supports dynamic restricted memory */
> > +#define OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM     BIT(9)
> >
> >  #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES       9
> >  #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
> > @@ -451,6 +454,72 @@ struct optee_smc_disable_shm_cache_result {
> >
> >  /* See OPTEE_SMC_CALL_WITH_REGD_ARG above */
> >  #define OPTEE_SMC_FUNCID_CALL_WITH_REGD_ARG  19
> > +/*
> > + * Get Secure Data Path memory config
> > + *
> > + * Returns the Secure Data Path memory config.
> > + *
> > + * Call register usage:
> > + * a0   SMC Function ID, OPTEE_SMC_GET_SDP_CONFIG
> > + * a2-6      Not used, must be zero
> > + * a7        Hypervisor Client ID register
> > + *
> > + * Have config return register usage:
> > + * a0        OPTEE_SMC_RETURN_OK
> > + * a1        Physical address of start of SDP memory
> > + * a2        Size of SDP memory
> > + * a3        Not used
> > + * a4-7      Preserved
> > + *
> > + * Not available register usage:
> > + * a0        OPTEE_SMC_RETURN_ENOTAVAIL
> > + * a1-3 Not used
> > + * a4-7      Preserved
> > + */
> > +#define OPTEE_SMC_FUNCID_GET_SDP_CONFIG              20
>
> Let's have a consistent ABI naming here. I think RSTMEM is more generic
> rather than SDP, so let's use same naming convention as we use for FF-A
> ABI.

Yes, I'll fix it.

Cheers,
Jens

>
> -Sumit
>
> > +#define OPTEE_SMC_GET_SDP_CONFIG \
> > +     OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_SDP_CONFIG)
> > +
> > +struct optee_smc_get_sdp_config_result {
> > +     unsigned long status;
> > +     unsigned long start;
> > +     unsigned long size;
> > +     unsigned long flags;
> > +};
> > +
> > +/*
> > + * Get Secure Data Path dynamic memory config
> > + *
> > + * Returns the Secure Data Path dynamic memory config.
> > + *
> > + * Call register usage:
> > + * a0        SMC Function ID, OPTEE_SMC_GET_DYN_SHM_CONFIG
> > + * a2-6      Not used, must be zero
> > + * a7        Hypervisor Client ID register
> > + *
> > + * Have config return register usage:
> > + * a0        OPTEE_SMC_RETURN_OK
> > + * a1        Minamal size of SDP memory
> > + * a2        Required alignment of size and start of registered SDP me=
mory
> > + * a3        Not used
> > + * a4-7      Preserved
> > + *
> > + * Not available register usage:
> > + * a0        OPTEE_SMC_RETURN_ENOTAVAIL
> > + * a1-3 Not used
> > + * a4-7      Preserved
> > + */
> > +
> > +#define OPTEE_SMC_FUNCID_GET_DYN_SDP_CONFIG  21
> > +#define OPTEE_SMC_GET_DYN_SDP_CONFIG \
> > +     OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_DYN_SDP_CONFIG)
> > +
> > +struct optee_smc_get_dyn_sdp_config_result {
> > +     unsigned long status;
> > +     unsigned long size;
> > +     unsigned long align;
> > +     unsigned long flags;
> > +};
> >
> >  /*
> >   * Resume from RPC (for example after processing a foreign interrupt)
> > --
> > 2.43.0
> >

