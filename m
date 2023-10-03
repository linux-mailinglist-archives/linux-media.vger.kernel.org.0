Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE86C7B661A
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 12:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239830AbjJCKNH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 06:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjJCKNG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 06:13:06 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749FC93
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 03:13:03 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9ad8a822508so125569266b.0
        for <linux-media@vger.kernel.org>; Tue, 03 Oct 2023 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696327982; x=1696932782; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CGx9pb5oFsHrHjOnMw60CG1tspFt5HQ44jWOAT6v1wQ=;
        b=QsbS0a1PE6t21MU+0mw6GFle317VAg2d4KQry9TRovd889LlKRq8ghntkeT+EnoHGH
         gBHw5YYNHgoj+MoNDFcW9a/9s3Int9RN2c2hYAHcfJvfZ1cuWPuCiKJKfzYZl4eKvAem
         QpzgPThay6udhm/6v9qn9MbiNx3+BwB3r7GemT+oB+H38afRBKKSu8dFTJwrFh9eZIVf
         lYzNQ9VljSXD18qLMWdMXzF0uvSe/6KDhqV1Rc7nNZPYSjj+dG7L7P0PCsxgFC6ywvtF
         kPMRRyhLOWdIDtQUHidiBEbsBiEvVmCRC6qTr5VEHIISUpZxnAC2cwq/j82fxhBVtTOr
         uevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696327982; x=1696932782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGx9pb5oFsHrHjOnMw60CG1tspFt5HQ44jWOAT6v1wQ=;
        b=YsoNyZ28KGQUUdoMopjdrLZwEzs47JriUJVXfrruQq/pVJD1HkNirkVBnaklV+LgyN
         JOLjehXyX+QxKr8Fglf74zQbYC0kCbKOFpXnW/h1HnYJKXd9uD8ii04V1cHppVMf/jEu
         2RxfAz+F726uPrSCG85XIxhthgfgRW2w27Vl6ULqe6YrRDYm/0KxCKdGAke9uD7lTvQM
         IAeVg3Awc1mQn9VWToVk6RJqCs0/4qsy5yazkv5C0ydX7cqG+iTQyB+nvkDHzLw9sPPN
         7n2ikvDWEVHeUzkoPLYUxDVR5LVO1DcaqoDnbdcRapmMyIVXsJPJOG480U7Zx5f70rRE
         UiOA==
X-Gm-Message-State: AOJu0YxXo05cd8NPJERRIZx5dR8X4Kow2mAxyuZxlwbK+Yu0Ns9W6L9u
        m7PprQM//vGUrtv9xS510Xw=
X-Google-Smtp-Source: AGHT+IG9N2ty7rX91WhwEZM4lu8V2n5BBaekVANg4/Eiik9+ihFMkPEZIuEhiYnsKYFMk5a5oa5XRg==
X-Received: by 2002:a17:907:b10:b0:9b2:78bf:d8d4 with SMTP id h16-20020a1709070b1000b009b278bfd8d4mr11297741ejl.5.1696327981665;
        Tue, 03 Oct 2023 03:13:01 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id dt26-20020a170906b79a00b0099290e2c163sm801992ejb.204.2023.10.03.03.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:13:01 -0700 (PDT)
Message-ID: <ccec8bb8310e65a7f0ab586d3eb204baa417989f.camel@gmail.com>
Subject: Re: [PATCH 02/15] media: intel/ipu6: add IPU auxiliary devices
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Date:   Tue, 03 Oct 2023 12:13:00 +0200
In-Reply-To: <20230727071558.1148653-3-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <20230727071558.1148653-3-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Even the IPU input system and processing system are in a single PCI
> device, each system has its own power sequence, the processing system
> power up depends on the input system power up.
>=20
> Besides, input system and processing system have their own MMU
> hardware for IPU DMA address mapping.
>=20
> Register the IS/PS devices on auxiliary bus and attach power domain
> to implement the power sequence dependency.

> +struct ipu6_subsystem_trace_config;

Unused

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ipu6_subsystem_trace_co=
nfig *trace_cfg;

Unused

> +#define to_ipu6_bus_driver(_drv) container_of(_drv, struct
> ipu6_bus_driver, drv)

Unused


Best regards,
Andreas
