Return-Path: <linux-media+bounces-876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA4F7F5B1D
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 10:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D79C281888
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 09:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B88121107;
	Thu, 23 Nov 2023 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+wheTU1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23396BA
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 01:33:49 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9fffa4c4f43so86028666b.3
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 01:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732027; x=1701336827; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EThZP+s7LosLrND8TNDZ0ZkFhj32e4dK+SWbnYppBiY=;
        b=j+wheTU1sTsuijnqZepYlH6fbYblxqg3fbL5MfWVedWbW3/GHSqXb9Rxf0LwmWZ8nJ
         bwgsWKsJGxrLVExaMJrvAZyv7udQ3okCEHbxxGq5v1eE4E7PsVWsT3FHKaF1/qB6T7jj
         /OqTTbM4ZHvKA56RT9L2t1hLsHKU7vXNkw459KAUY6gtiefCgaMoPR8e23/zewbZShuj
         5Qmgco2lVossl7fVwZuR4FnMC8Srv/RiMOBfsAO5NFnfvbI+s1ltOhR1QysANOtKV1QG
         coMxpAWM1Uc2y58RLMzlLs2hkRsILw45SrVCn9+NqdSMYOrFg4dnCaSIqNj6YBd2iDpK
         RcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732027; x=1701336827;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EThZP+s7LosLrND8TNDZ0ZkFhj32e4dK+SWbnYppBiY=;
        b=pF31JJGfuGk8FA6AMJCtvCJYg9BlVjrxA2IdchC8SBQS1A+ccD87uLiXEgOZ7e+f3N
         7spS1Ln3Ry/A1SDCrToseH4s/xnk/57DJRKJkLLNwxNyZP7jh/RrJOwSGrefiY6mX5ip
         iPMnCDrSUEL9b8AEZM3Wp82SGaGi8v7LD8enTDniBhpa5d/otYexAJBdtYr+fM7d2FBR
         Un4yyG8m7hqrKF4IjBCuBKVnxDgvMlZYY1WsIRGqYqqXRKYMLOqtJHlP2lfCQnsfujbb
         LdgBAlGwfXmRSmQHYmVpS8Gy09b6c84K1stOJrxCSvWZh4gcQgMAKULx2u4Shw0POJV4
         bPQg==
X-Gm-Message-State: AOJu0YwKEaAKTc6pSEMfUSxYIa3p4uVK3pBYWIxh4MZf5MjY6u5KKwxA
	NGxmH4587Lf+9ZRmEXyvjXo=
X-Google-Smtp-Source: AGHT+IHRu47B2DKIfueRfkwxq0TosxUQbpJOzkRuTbM0X6i3RZ2sh/06F58V7pMYOjUBypvbtN3jMA==
X-Received: by 2002:a17:906:51ca:b0:9ae:699d:8a2a with SMTP id v10-20020a17090651ca00b009ae699d8a2amr3234401ejk.5.1700732027160;
        Thu, 23 Nov 2023 01:33:47 -0800 (PST)
Received: from [192.168.50.250] (c-x599688ac.customers.hiper-net.dk. [89.150.136.172])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090626c300b009a5f1d15644sm532554ejc.119.2023.11.23.01.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:33:46 -0800 (PST)
Message-ID: <c8ad7da6ea24b31aab2eead0d822f8dc897a105e.camel@gmail.com>
Subject: Re: [PATCH v2 06/15] media: intel/ipu6: add syscom interfaces
 between firmware and driver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org,  senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Thu, 23 Nov 2023 10:33:44 +0100
In-Reply-To: <20231024112924.3934228-7-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
	 <20231024112924.3934228-7-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Syscom is an inter-process(or) communication mechanism between an IPU
> and host. Syscom uses message queues for message exchange between IPU
> and host. Each message queue has its consumer and producer, host
> queue
> messages to firmware as the producer and then firmware to dequeue the
> messages as consumer and vice versa. IPU and host use shared
> registers
> or memory to reside the read and write indices which are updated by
> consumer and producer.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-fw-com.c | 411
> +++++++++++++++++++++
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-fw-com.h |=C2=A0 47 +++
> =C2=A02 files changed, 458 insertions(+)
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
...
> +struct ipu6_fw_com_context {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ipu6_bus_device *adev;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *dmem_addr;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int (*cell_ready)(struct ipu6_=
bus_device *adev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void (*cell_start)(struct ipu6=
_bus_device *adev);

Why are cell_ready and cell_start function pointers? They seem to
always be set to query_sp and start_sp.

> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void *dma_buffer;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_addr_t dma_addr;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int dma_size;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long attrs;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ipu6_fw_sys_queue *inpu=
t_queue;=C2=A0=C2=A0/* array of host to
> SP queues */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ipu6_fw_sys_queue *outp=
ut_queue;=C2=A0/* array of SP to
> host */
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 config_vied_addr;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int buttress_boot_off=
set;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *base_addr;
> +};
> +
> +#define FW_COM_WR_REG 0
> +#define FW_COM_RD_REG 4
> +
> +#define REGMEM_OFFSET 0
> +#define TUNIT_MAGIC_PATTERN 0x5a5a5a5a
> +
> +enum regmem_id {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* pass pkg_dir address to SPC=
 in non-secure mode */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PKG_DIR_ADDR_REG =3D 0,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Tunit CFG blob for secure -=
 provided by host.*/
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0TUNIT_CFG_DWR_REG =3D 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* syscom commands - modified =
by the host */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SYSCOM_COMMAND_REG =3D 2,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Store interrupt status - up=
dated by SP */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SYSCOM_IRQ_REG =3D 3,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* first syscom queue pointer =
register */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SYSCOM_QPR_BASE_REG =3D 4
> +};
> +
> +enum message_direction {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DIR_RECV =3D 0,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DIR_SEND
> +};

Not used?


...
> +struct ipu6_fw_com_cfg {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int num_input_queues;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int num_output_queues=
;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ipu6_fw_syscom_queue_co=
nfig *input;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ipu6_fw_syscom_queue_co=
nfig *output;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int dmem_addr;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* firmware-specific configura=
tion data */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void *specific_addr;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int specific_size;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int (*cell_ready)(struct ipu6_=
bus_device *adev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void (*cell_start)(struct ipu6=
_bus_device *adev);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int buttress_boot_off=
set;

This seems to always be 0 (set by ipu6-fw-isys.c), seems to be trivial
to remove.

/Andreas

