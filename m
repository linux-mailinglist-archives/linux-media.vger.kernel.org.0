Return-Path: <linux-media+bounces-3185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CA822A3F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 10:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B0F1F21E79
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 09:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9389A182C3;
	Wed,  3 Jan 2024 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAOAgjSU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D458182B5
	for <linux-media@vger.kernel.org>; Wed,  3 Jan 2024 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-555144cd330so7827035a12.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jan 2024 01:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704273946; x=1704878746; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nr/UKlp+7oCxK+O8JFfrwz35XIwBexKtqtpiSblbYDc=;
        b=KAOAgjSUxYu9IGekauZV1RrW0JNRqt/Bm7QknumyuXaRELDlJlkNJoZL87EBJIy7Kg
         zcxW1oHmEnnOvewZKD55CcTuq1EIGjZvGf/IuDAc19KsbUO10VJUIpe2wUOoTsnLUPVN
         XN81BKMkx0AnG2g4MzL/SCH/9FPLZq4hKvZMv/GNbcuImjtonqYeYmFQd/Qd7VzB8RCo
         DG3geGZe8tQ0SHNmqIdQ7JS4u8ZSfanEg2B5CqKuD0UirynjIzNpCZt9bfwbIc93S2np
         2Ia7SyNXYoCVMhw/ZHNHD0E8+62NIQBytwkjLesIdGH2J8nVNDKXsuz2MQQ496ys9fjZ
         4gjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704273946; x=1704878746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nr/UKlp+7oCxK+O8JFfrwz35XIwBexKtqtpiSblbYDc=;
        b=QGFCTuuw2Mcj+fRfrucm2U5jNLTIgwuEEwliLl5SjpLzyRbFxoB/ib1Tq5FvnQYkMT
         FZTIX7HipFRsrkVGsLzFp0C5IbHK/eKqmON+8FaS3yw2jZAXgLgXb9cQ9S/w4fe1tj04
         qbnTUkcyyPKAdRXMXTgDiZSpKH25QMh4JNVXLGBOEvjBOFmQavQ8G5KYOQK3R1iOUG+x
         2xsUQXki1spEU7Wi3vl/7W6J83QakIIjZhV3BhnD04K65P4cfZQeARYmKFZx74ASs7Fs
         93JXnx5OeMr5IQ6sQzE/1KQMt4ucXJFOiDR8KlvvK7I9m9e+ZV9M0h5OdKnCJszBnAq0
         dRLQ==
X-Gm-Message-State: AOJu0YwFG9ocJPR7pgGT2IvOY5FzTP/tWsX2QILtMS45YaU6NkkMNyIp
	qdy4XakBmxg/ofAV81Awzg8=
X-Google-Smtp-Source: AGHT+IGn9BbbJkwZgo2P4Jh05eVuXZDlFLi1VfaU3kNxb5qACh9j6GRbUL946mFYaQ3GolKtgiuA3Q==
X-Received: by 2002:a17:906:4e4a:b0:a28:a8cb:3185 with SMTP id g10-20020a1709064e4a00b00a28a8cb3185mr127585ejw.69.1704273946308;
        Wed, 03 Jan 2024 01:25:46 -0800 (PST)
Received: from [192.168.50.250] (c-x59968899.customers.hiper-net.dk. [89.150.136.153])
        by smtp.gmail.com with ESMTPSA id qc28-20020a170906d8bc00b00a279b182e42sm4742185ejb.171.2024.01.03.01.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 01:25:45 -0800 (PST)
Message-ID: <d0c7365f1fbb13d7c79e05d7280d4405fc317414.camel@gmail.com>
Subject: Re: [PATCH v2 06/15] media: intel/ipu6: add syscom interfaces
 between firmware and driver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com, 
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org,  senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com,  tian.shu.qiu@intel.com,
 hongju.wang@intel.com
Date: Wed, 03 Jan 2024 10:25:44 +0100
In-Reply-To: <36bb9aee-409c-88d0-30e3-a34de23c8577@linux.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
	 <20231024112924.3934228-7-bingbu.cao@intel.com>
	 <c8ad7da6ea24b31aab2eead0d822f8dc897a105e.camel@gmail.com>
	 <36bb9aee-409c-88d0-30e3-a34de23c8577@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,=C2=A0

On Thu, 2023-12-28 at 14:39 +0800, Bingbu Cao wrote:
> Andreas,
>=20
> On 11/23/23 5:33 PM, Andreas Helbech Kleist wrote:
> > Hi,
> >=20
> > On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
> > > From: Bingbu Cao <bingbu.cao@intel.com>
> > >=20
> > > Syscom is an inter-process(or) communication mechanism between an IPU
> > > and host. Syscom uses message queues for message exchange between IPU
> > > and host. Each message queue has its consumer and producer, host
> > > queue
> > > messages to firmware as the producer and then firmware to dequeue the
> > > messages as consumer and vice versa. IPU and host use shared
> > > registers
> > > or memory to reside the read and write indices which are updated by
> > > consumer and producer.
> > >=20
> > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > ---
> > >  drivers/media/pci/intel/ipu6/ipu6-fw-com.c | 411
> > > +++++++++++++++++++++
> > >  drivers/media/pci/intel/ipu6/ipu6-fw-com.h |  47 +++
> > >  2 files changed, 458 insertions(+)
> > >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
> > >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
> > ...
> > > +struct ipu6_fw_com_context {
> > > +       struct ipu6_bus_device *adev;
> > > +       void __iomem *dmem_addr;
> > > +       int (*cell_ready)(struct ipu6_bus_device *adev);
> > > +       void (*cell_start)(struct ipu6_bus_device *adev);
> >=20
> > Why are cell_ready and cell_start function pointers? They seem to
> > always be set to query_sp and start_sp.
> >=20
> > > +
> > > +       void *dma_buffer;
> > > +       dma_addr_t dma_addr;
> > > +       unsigned int dma_size;
> > > +       unsigned long attrs;
> > > +
> > > +       struct ipu6_fw_sys_queue *input_queue;  /* array of host to
> > > SP queues */
> > > +       struct ipu6_fw_sys_queue *output_queue; /* array of SP to
> > > host */
> > > +
> > > +       u32 config_vied_addr;
> > > +
> > > +       unsigned int buttress_boot_offset;
> > > +       void __iomem *base_addr;
> > > +};
> > > +
> > > +#define FW_COM_WR_REG 0
> > > +#define FW_COM_RD_REG 4
> > > +
> > > +#define REGMEM_OFFSET 0
> > > +#define TUNIT_MAGIC_PATTERN 0x5a5a5a5a
> > > +
> > > +enum regmem_id {
> > > +       /* pass pkg_dir address to SPC in non-secure mode */
> > > +       PKG_DIR_ADDR_REG =3D 0,
> > > +       /* Tunit CFG blob for secure - provided by host.*/
> > > +       TUNIT_CFG_DWR_REG =3D 1,
> > > +       /* syscom commands - modified by the host */
> > > +       SYSCOM_COMMAND_REG =3D 2,
> > > +       /* Store interrupt status - updated by SP */
> > > +       SYSCOM_IRQ_REG =3D 3,
> > > +       /* first syscom queue pointer register */
> > > +       SYSCOM_QPR_BASE_REG =3D 4
> > > +};
> > > +
> > > +enum message_direction {
> > > +       DIR_RECV =3D 0,
> > > +       DIR_SEND
> > > +};
> >=20
> > Not used?
>=20
> Ack, will remove.
>=20
> >=20
> >=20
> > ...
> > > +struct ipu6_fw_com_cfg {
> > > +       unsigned int num_input_queues;
> > > +       unsigned int num_output_queues;
> > > +       struct ipu6_fw_syscom_queue_config *input;
> > > +       struct ipu6_fw_syscom_queue_config *output;
> > > +
> > > +       unsigned int dmem_addr;
> > > +
> > > +       /* firmware-specific configuration data */
> > > +       void *specific_addr;
> > > +       unsigned int specific_size;
> > > +       int (*cell_ready)(struct ipu6_bus_device *adev);
> > > +       void (*cell_start)(struct ipu6_bus_device *adev);
> > > +
> > > +       unsigned int buttress_boot_offset;
> >=20
> > This seems to always be 0 (set by ipu6-fw-isys.c), seems to be trivial
> > to remove.
>=20
> All these fields are all used to extend for psys driver.

Then I suppose they can be added if a psys driver is submitted upstream
at some point.

Is is it the intention to submit a psys driver as well?

/Andreas


