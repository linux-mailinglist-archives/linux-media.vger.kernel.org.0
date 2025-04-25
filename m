Return-Path: <linux-media+bounces-31067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DCDA9CA81
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 15:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C5C77AE577
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 13:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D83A24A061;
	Fri, 25 Apr 2025 13:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rno+YtSM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B70B2701D7
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588209; cv=none; b=XxAo8spnYDNDx/9ncNg6jFCFPi++msm61X1Kuvvgnm9mQ55bqAHX+rfMYmTnO9jQB+PPeDUpEDGwa9kyuleJp6IWn6KaXtjSXQN1icYeMcsma/FcZv6iwztC4+Xcp6t/ydJKJoBW4Qv0LmEG7n2fymu0pY+9kWpb5ux6YyIazyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588209; c=relaxed/simple;
	bh=AEqJnODET+EvOKOEH17dzoeJNOFsqttW6a3evyJ0v4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lz0MNThrOqfNP0Z2/1N3gOyBi83uh0T4eoDzvdAASk5CBVAeAHvoFlf0q7t4+a4hDp8g6yH+1AARKUPlLGx9JzRwzeKmX6LP9ti14oL6EZCWbirVZmVFKoS1aAKy+ZIXrWsP02EhfevvrPHE1X2T4BCwRjn3i5kGGhk/u5ekKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rno+YtSM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so4321090a12.2
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745588205; x=1746193005; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HTyBdYK9QHtfmQZsIeeNm4rwCrR2M4f8xsWgO6o7yV4=;
        b=rno+YtSMyUbwwXQt+u+/pFAbq1w5Oqr+7jZpBmyaptIeLcUZtQiYNqg95FPb2gVaNz
         qwLYkaBx9NtYDEtsRDc1kdQhNbEwCzPTenWst8Bi/UD09dQBgnzs05iR+Zq7Di2kruiP
         LGgzcWa/Nr4iySOK8U2Ee50iIuFsYt6j2+Cg3HZcQEEbv/oP8IGiVznl8wCJNHl06meZ
         fYIlO09xYNifl3sL9m4aApwUmKorQetuuvJNnlCvNRPoBUny28j0op009F68u4f2lCtS
         w/WkifzVV7Pg7T9KmDmzimW9ZWUYHWm7jNkfBfUdVAmZTQ8BJ2MGojOY+QGN5Hq3em6M
         dLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588205; x=1746193005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTyBdYK9QHtfmQZsIeeNm4rwCrR2M4f8xsWgO6o7yV4=;
        b=d+c4Gk8nzkKkmalGIc70dZ3f+v8i7+hG75c1MLgLIGzf0JSnIVShaO7gzffUMOGki/
         Ki3fnjId/s9wgPkFxDAOQyLTBQ8Gr69JKIlLwj8MPD7ZkN9UMy7x4IuqcaXe9nK5fgww
         PAwm568O5yMmvlYLPU2+YsOWuFY1qOrs1ysXOJMP5Afg0eoo7RUquW0LH8Fh73bYmBcm
         JjSWRcWFgo/PGr4uT+/YUP4w3xth3OixixUwHJz8YklGD3fehTAxvTrXfycwJWClbWxA
         /lM/rR1qkLgRIiER1EGbgtzbLzSpAAEUxMrEqGz1NdEGGmeDlzzIbZNS7NO2DZ3Ub4TK
         OqLA==
X-Forwarded-Encrypted: i=1; AJvYcCXwf/ZCrgLkxZhxHXMhkrgG6/AhlJLAgwa1KivXGc7kUZm4o6wiFE9dYrSyPmgI2I2ZxCfFXO1CCHt6vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZMGbYgmqJTT8VOaJWsXqOFhdJ/X/21fmCSGJmghlHi4XNX3M
	HWZftA0lgs2fH9qSTGv0106FmAQygkB/opCaNeSwJGEoAGoiCkCRg7cwn3xpD3NNEGW/i2p4D++
	JOca9F6/2UNW0yGMFRZQpIKQAe6yN6aW/iFglwA==
X-Gm-Gg: ASbGncsEXv1j8uEknZEbz9vM+sjQTtSszCBwGx+qT4SGORET/wy0SipxD0tb8AXyMn9
	eYDJ0Seq+8ES4ppavJXYgSXcmjhMrrjEBYUSvlit/L2vnAqWDvooVK116UbndisiO0u8jkzgsfa
	rL/ho4vbjV8VQb59Vj885F1pm474gFRffQIUzyI3afxG5EDal3a00FG5E=
X-Google-Smtp-Source: AGHT+IE7SPxlVH3PkxOOB55XTbBPfO/7JEFTukIQStQPN0fihbHuXz0FkHYC68Cqk0Q9M/qOq82CDuNzvmZ6Nh2nFq4=
X-Received: by 2002:a05:6402:4309:b0:5f6:23b1:ab4b with SMTP id
 4fb4d7f45d1cf-5f723a1d32fmr2029504a12.30.1745588205252; Fri, 25 Apr 2025
 06:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404143215.2281034-1-jens.wiklander@linaro.org> <20250404143215.2281034-5-jens.wiklander@linaro.org>
In-Reply-To: <20250404143215.2281034-5-jens.wiklander@linaro.org>
From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Date: Fri, 25 Apr 2025 15:36:33 +0200
X-Gm-Features: ATxdqUGYPWHtY03dwLh1zXB-k8A70x8RLBAD7gk6FeZVRcqYmVrqVAOIUH5hmp8
Message-ID: <CAK8z29XHZXo5e1u8q_0D=iWxr3V2m7PateRGgqVGFe-WDeFKGg@mail.gmail.com>
Subject: Re: [PATCH v7 04/11] optee: sync secure world ABI headers
To: Jens Wiklander <jens.wiklander@linaro.org>
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

Hi,

On Fri, 4 Apr 2025 at 16:31, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Update the header files describing the secure world ABI, both with and
> without FF-A. The ABI is extended to deal with protected memory, but as
> usual backward compatible.
>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/optee_ffa.h | 27 +++++++++---
>  drivers/tee/optee/optee_msg.h | 83 ++++++++++++++++++++++++++++++-----
>  drivers/tee/optee/optee_smc.h | 71 +++++++++++++++++++++++++++++-
>  3 files changed, 163 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa.h
> index 257735ae5b56..cc257e7956a3 100644
> --- a/drivers/tee/optee/optee_ffa.h
> +++ b/drivers/tee/optee/optee_ffa.h
> @@ -81,7 +81,7 @@
>   *                   as the second MSG arg struct for
>   *                   OPTEE_FFA_YIELDING_CALL_WITH_ARG.
>   *        Bit[31:8]: Reserved (MBZ)
> - * w5:   Bitfield of secure world capabilities OPTEE_FFA_SEC_CAP_* below,
> + * w5:   Bitfield of OP-TEE capabilities OPTEE_FFA_SEC_CAP_*
>   * w6:   The maximum secure world notification number
>   * w7:   Not used (MBZ)
>   */
> @@ -94,6 +94,8 @@
>  #define OPTEE_FFA_SEC_CAP_ASYNC_NOTIF  BIT(1)
>  /* OP-TEE supports probing for RPMB device if needed */
>  #define OPTEE_FFA_SEC_CAP_RPMB_PROBE   BIT(2)
> +/* OP-TEE supports Protected Memory for secure data path */
> +#define OPTEE_FFA_SEC_CAP_PROTMEM      BIT(3)
>
>  #define OPTEE_FFA_EXCHANGE_CAPABILITIES OPTEE_FFA_BLOCKING_CALL(2)
>
> @@ -108,7 +110,7 @@
>   *
>   * Return register usage:
>   * w3:    Error code, 0 on success
> - * w4-w7: Note used (MBZ)
> + * w4-w7: Not used (MBZ)
>   */
>  #define OPTEE_FFA_UNREGISTER_SHM       OPTEE_FFA_BLOCKING_CALL(3)
>
> @@ -119,16 +121,31 @@
>   * Call register usage:
>   * w3:    Service ID, OPTEE_FFA_ENABLE_ASYNC_NOTIF
>   * w4:   Notification value to request bottom half processing, should be
> - *       less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE.
> + *       less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE
>   * w5-w7: Not used (MBZ)
>   *
>   * Return register usage:
>   * w3:    Error code, 0 on success
> - * w4-w7: Note used (MBZ)
> + * w4-w7: Not used (MBZ)
>   */
>  #define OPTEE_FFA_ENABLE_ASYNC_NOTIF   OPTEE_FFA_BLOCKING_CALL(5)
>
> -#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE 64
> +#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE        64
> +
> +/*
> + * Release Protected memory
> + *
> + * Call register usage:
> + * w3:    Service ID, OPTEE_FFA_RECLAIM_PROTMEM
> + * w4:    Shared memory handle, lower bits
> + * w5:    Shared memory handle, higher bits
> + * w6-w7: Not used (MBZ)
> + *
> + * Return register usage:
> + * w3:    Error code, 0 on success
> + * w4-w7: Note used (MBZ)
> + */
> +#define OPTEE_FFA_RELEASE_PROTMEM      OPTEE_FFA_BLOCKING_CALL(8)
>
>  /*
>   * Call with struct optee_msg_arg as argument in the supplied shared memory
> diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
> index e8840a82b983..22d71d6f110d 100644
> --- a/drivers/tee/optee/optee_msg.h
> +++ b/drivers/tee/optee/optee_msg.h
> @@ -133,13 +133,13 @@ struct optee_msg_param_rmem {
>  };
>
>  /**
> - * struct optee_msg_param_fmem - ffa memory reference parameter
> + * struct optee_msg_param_fmem - FF-A memory reference parameter
>   * @offs_lower:           Lower bits of offset into shared memory reference
>   * @offs_upper:           Upper bits of offset into shared memory reference
>   * @internal_offs: Internal offset into the first page of shared memory
>   *                reference
>   * @size:         Size of the buffer
> - * @global_id:    Global identifier of Shared memory
> + * @global_id:    Global identifier of the shared memory
>   */
>  struct optee_msg_param_fmem {
>         u32 offs_low;
> @@ -165,7 +165,7 @@ struct optee_msg_param_value {
>   * @attr:      attributes
>   * @tmem:      parameter by temporary memory reference
>   * @rmem:      parameter by registered memory reference
> - * @fmem:      parameter by ffa registered memory reference
> + * @fmem:      parameter by FF-A registered memory reference
>   * @value:     parameter by opaque value
>   * @octets:    parameter by octet string
>   *
> @@ -296,6 +296,18 @@ struct optee_msg_arg {
>   */
>  #define OPTEE_MSG_FUNCID_GET_OS_REVISION       0x0001
>
> +/*
> + * Values used in OPTEE_MSG_CMD_LEND_PROTMEM below
> + * OPTEE_MSG_PROTMEM_RESERVED          Reserved
> + * OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY Secure Video Playback
> + * OPTEE_MSG_PROTMEM_TRUSTED_UI                Trused UI
> + * OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD       Secure Video Recording
> + */
> +#define OPTEE_MSG_PROTMEM_RESERVED             0
> +#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY    1
> +#define OPTEE_MSG_PROTMEM_TRUSTED_UI           2
> +#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD  3
> +
>  /*
>   * Do a secure call with struct optee_msg_arg as argument
>   * The OPTEE_MSG_CMD_* below defines what goes in struct optee_msg_arg::cmd
> @@ -337,15 +349,62 @@ struct optee_msg_arg {
>   * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF informs secure world that from now is
>   * normal world unable to process asynchronous notifications. Typically
>   * used when the driver is shut down.
> + *
> + * OPTEE_MSG_CMD_LEND_PROTMEM lends protected memory. The passed normal
> + * physical memory is protected from normal world access. The memory
> + * should be unmapped prior to this call since it becomes inaccessible
> + * during the request.
> + * Parameters are passed as:
> + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> + * [in] param[0].u.value.a             OPTEE_MSG_PROTMEM_* defined above
> + * [in] param[1].attr                  OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
> + * [in] param[1].u.tmem.buf_ptr                physical address
> + * [in] param[1].u.tmem.size           size
> + * [in] param[1].u.tmem.shm_ref                holds protected memory reference
> + *
> + * OPTEE_MSG_CMD_RECLAIM_PROTMEM reclaims a previously lent protected
> + * memory reference. The physical memory is accessible by the normal world
> + * after this function has return and can be mapped again. The information
> + * is passed as:
> + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> + * [in] param[0].u.value.a             holds protected memory cookie
> + *
> + * OPTEE_MSG_CMD_GET_PROTMEM_CONFIG get configuration for a specific
> + * protected memory use case. Parameters are passed as:
> + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INOUT
> + * [in] param[0].value.a               OPTEE_MSG_PROTMEM_*
> + * [in] param[1].attr                  OPTEE_MSG_ATTR_TYPE_{R,F}MEM_OUTPUT
> + * [in] param[1].u.{r,f}mem            Buffer or NULL
> + * [in] param[1].u.{r,f}mem.size       Provided size of buffer or 0 for query
> + * output for the protected use case:
> + * [out] param[0].value.a              Minimal size of protected memory
> + * [out] param[0].value.b              Required alignment of size and start of
> + *                                     protected memory
> + * [out] param[1].{r,f}mem.size                Size of output data
> + * [out] param[1].{r,f}mem             If non-NULL, contains an array of
> + *                                     uint16_t holding endpoints that
> + *                                     must be included when lending
> + *                                     memory for this use case
> + *
> + * OPTEE_MSG_CMD_ASSIGN_PROTMEM assigns use-case to protected memory
> + * previously lent using the FFA_LEND framework ABI. Parameters are passed
> + * as:
> + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> + * [in] param[0].u.value.a             holds protected memory cookie
> + * [in] param[0].u.value.b             OPTEE_MSG_PROTMEM_* defined above
>   */
> -#define OPTEE_MSG_CMD_OPEN_SESSION     0
> -#define OPTEE_MSG_CMD_INVOKE_COMMAND   1
> -#define OPTEE_MSG_CMD_CLOSE_SESSION    2
> -#define OPTEE_MSG_CMD_CANCEL           3
> -#define OPTEE_MSG_CMD_REGISTER_SHM     4
> -#define OPTEE_MSG_CMD_UNREGISTER_SHM   5
> -#define OPTEE_MSG_CMD_DO_BOTTOM_HALF   6
> -#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF 7
> -#define OPTEE_MSG_FUNCID_CALL_WITH_ARG 0x0004
> +#define OPTEE_MSG_CMD_OPEN_SESSION             0
> +#define OPTEE_MSG_CMD_INVOKE_COMMAND           1
> +#define OPTEE_MSG_CMD_CLOSE_SESSION            2
> +#define OPTEE_MSG_CMD_CANCEL                   3
> +#define OPTEE_MSG_CMD_REGISTER_SHM             4
> +#define OPTEE_MSG_CMD_UNREGISTER_SHM           5
> +#define OPTEE_MSG_CMD_DO_BOTTOM_HALF           6
> +#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF         7
> +#define OPTEE_MSG_CMD_LEND_PROTMEM             8
> +#define OPTEE_MSG_CMD_RECLAIM_PROTMEM          9
> +#define OPTEE_MSG_CMD_GET_PROTMEM_CONFIG       10
> +#define OPTEE_MSG_CMD_ASSIGN_PROTMEM           11
> +#define OPTEE_MSG_FUNCID_CALL_WITH_ARG         0x0004
>
>  #endif /* _OPTEE_MSG_H */
> diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
> index 879426300821..b17e81f464a3 100644
> --- a/drivers/tee/optee/optee_smc.h
> +++ b/drivers/tee/optee/optee_smc.h
> @@ -264,7 +264,6 @@ struct optee_smc_get_shm_config_result {
>  #define OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM    BIT(0)
>  /* Secure world can communicate via previously unregistered shared memory */
>  #define OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM     BIT(1)
> -
>  /*
>   * Secure world supports commands "register/unregister shared memory",
>   * secure world accepts command buffers located in any parts of non-secure RAM
> @@ -280,6 +279,10 @@ struct optee_smc_get_shm_config_result {
>  #define OPTEE_SMC_SEC_CAP_RPC_ARG              BIT(6)
>  /* Secure world supports probing for RPMB device if needed */
>  #define OPTEE_SMC_SEC_CAP_RPMB_PROBE           BIT(7)
> +/* Secure world supports protected memory */
> +#define OPTEE_SMC_SEC_CAP_PROTMEM              BIT(8)
> +/* Secure world supports dynamic protected memory */
> +#define OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM      BIT(9)
>
>  #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES 9
>  #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
> @@ -451,6 +454,72 @@ struct optee_smc_disable_shm_cache_result {
>
>  /* See OPTEE_SMC_CALL_WITH_REGD_ARG above */
>  #define OPTEE_SMC_FUNCID_CALL_WITH_REGD_ARG    19
> +/*
> + * Get protected memory config
> + *
> + * Returns the protected memory config.
> + *
> + * Call register usage:
> + * a0   SMC Function ID, OPTEE_SMC_GET_PROTMEM_CONFIG
> + * a2-6        Not used, must be zero
> + * a7  Hypervisor Client ID register
> + *
> + * Have config return register usage:
> + * a0  OPTEE_SMC_RETURN_OK
> + * a1  Physical address of start of protected memory
> + * a2  Size of protected memory
> + * a3  Not used
> + * a4-7        Preserved
> + *
> + * Not available register usage:
> + * a0  OPTEE_SMC_RETURN_ENOTAVAIL
> + * a1-3 Not used
> + * a4-7        Preserved
> + */
> +#define OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG            20
> +#define OPTEE_SMC_GET_PROTMEM_CONFIG \
> +       OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG)
> +
> +struct optee_smc_get_protmem_config_result {
> +       unsigned long status;
> +       unsigned long start;
> +       unsigned long size;
> +       unsigned long flags;

The ABI comment does not document a flags return argument, either
this can be removed or the ABI comment needs to be fixed.
Same for
> +};
> +
> +/*
> + * Get dynamic protected memory config
> + *
> + * Returns the dynamic protected memory config.
> + *
> + * Call register usage:
> + * a0  SMC Function ID, OPTEE_SMC_GET_DYN_SHM_CONFIG

should be OPTEE_SMC_GET_DYN_PROTMEM_CONFIG

> + * a2-6        Not used, must be zero
> + * a7  Hypervisor Client ID register
> + *
> + * Have config return register usage:
> + * a0  OPTEE_SMC_RETURN_OK
> + * a1  Minamal size of protected memory

Nit: Typo, should be "Minimal"

> + * a2  Required alignment of size and start of registered protected memory
> + * a3  Not used
> + * a4-7        Preserved
> + *
> + * Not available register usage:
> + * a0  OPTEE_SMC_RETURN_ENOTAVAIL
> + * a1-3 Not used
> + * a4-7        Preserved
> + */
> +
> +#define OPTEE_SMC_FUNCID_GET_DYN_PROTMEM_CONFIG        21
> +#define OPTEE_SMC_GET_DYN_PROTMEM_CONFIG \
> +       OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_DYN_PROTMEM_CONFIG)
> +
> +struct optee_smc_get_dyn_protmem_config_result {
> +       unsigned long status;
> +       unsigned long size;
> +       unsigned long align;
> +       unsigned long flags;
> +};
>
>  /*
>   * Resume from RPC (for example after processing a foreign interrupt)
> --
> 2.43.0

- Rouven

