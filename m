Return-Path: <linux-media+bounces-42732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA13AB86E5D
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 22:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54B781CC455A
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 20:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FA431BC94;
	Thu, 18 Sep 2025 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxI1kMrP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9462EAB60
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758226950; cv=none; b=eYZ7YM8P41YPH3LQ1zty/LDxt1q8T1KYcXOt+HxiA0PRCPI97lL8zdv9+xkn4+vgbNUF6eZXCNYcuvS04v23M8vdqOCeKZsD7E00zfeaBNSMK9zlt/489hB0WOyONJ9aZYzZSrHVGHftmcJtMOF+9URG3W7jFImCsTrnSiwiXPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758226950; c=relaxed/simple;
	bh=QjNmDwrXMkVGE6227hZ98N5IIzCiYBnxH21RS1w/p04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqYQuUsZ4H4N2b4hq4lJJ27kBYulW6zmemeFcctDocJVHwT98ZenKxjWvtmLM+PrAqx8Ffwsjernda/X94RyKJa6LsTTcjiN2E5csRhOlfn+nDclAuZSXPh2B4vMc2XOxlqk/muxuTRfqBVjd/l4zP/lB6I60mQbpmP/kjG9h/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxI1kMrP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C92C4CEFD
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 20:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758226949;
	bh=QjNmDwrXMkVGE6227hZ98N5IIzCiYBnxH21RS1w/p04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YxI1kMrPqsBOsfgCaLSTQ5RW3a7AoWfvsOwTpUcqmiXqf3R88GjJcd6BfSMY0bPOZ
	 S3r/XpEKWhzMJX1y6DqZKlKf90zRoMcXStKcC6/jAQv/bwE7fZ+Co2YpPaAKbow/yq
	 nPBjpG5soOwhHaQ1UTnDVuLC/VK3kSm1IUB+aRehFcKs9ceFMXUO95PqsNtSl9i0ds
	 gMvnGF2TBTqeWMBUU7w47crXAxFccnSZl9TUqmDO0wnyEgldEn/rA2pc+qdPN1Yziw
	 AouHPka3McJOvZ1Ol7IdmZLulIn3a+74NpR6bNZb+Rv0+DYjkDN4002aZi2Xld/Tz7
	 hd/DiOUMRKseg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62f0bf564e4so1655331a12.3
        for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 13:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2XdrO7qZHugkUJSOr0Om0mwIBgtLjV5AKoFHHH/VfOQL89Ji+fC3Q2X9MtePl1Yvo/Aanvb8oMgUU+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa354dPNg7Yz71k68+oD6tExBBsWTMiQAe045e9UHtIDiBvM7g
	h8qKVdhX7l0Snm1LspmXG/qV1XlY7e9KxiemcC1vqyKJsMFX7B9zMOkZLG4lF4dm4D024RRwN5E
	LOnUVPlPxDOZyCi2a/pSonAYhebnqQg==
X-Google-Smtp-Source: AGHT+IFajxjcKFx3zWO77Gy/c7uJiTNdaDUhcRVQ1r7GoNy7DX8Ynp1ebJyWs8GOaL2Y1BaCBd9H5rnv7Pyyv/bZLi0=
X-Received: by 2002:a05:6402:21c6:b0:62f:a51b:f839 with SMTP id
 4fb4d7f45d1cf-62fc0a6e182mr518403a12.32.1758226948397; Thu, 18 Sep 2025
 13:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813214949.897858-1-robh@kernel.org>
In-Reply-To: <20250813214949.897858-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 18 Sep 2025 15:22:15 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+vUNtMw6JS0ac6a8LTdJBB+UepadpDxP_S8vr6QwUiNA@mail.gmail.com>
X-Gm-Features: AS18NWDedZhOrWTNOyy1X1kKu1N_5AKCHYvPnHcoB1LsY8J75zpcDn2q59JgBhQ
Message-ID: <CAL_Jsq+vUNtMw6JS0ac6a8LTdJBB+UepadpDxP_S8vr6QwUiNA@mail.gmail.com>
Subject: Re: [PATCH v2] media: Use of_reserved_mem_region_to_resource() for "memory-region"
To: Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Dikshita Agarwal <quic_dikshita@quicinc.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Ming Qian <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 4:50=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
>
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Rebase on v6.17-rc1
> ---
>  drivers/media/platform/amphion/vpu_core.c     | 40 +++++--------------
>  .../media/platform/qcom/iris/iris_firmware.c  | 18 +++------
>  drivers/media/platform/qcom/venus/firmware.c  | 19 +++------
>  3 files changed, 21 insertions(+), 56 deletions(-)

Ping!

>
> diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/pl=
atform/amphion/vpu_core.c
> index da00f5fc0e5d..168f0514851e 100644
> --- a/drivers/media/platform/amphion/vpu_core.c
> +++ b/drivers/media/platform/amphion/vpu_core.c
> @@ -10,7 +10,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> @@ -542,47 +542,30 @@ const struct vpu_core_resources *vpu_get_resource(s=
truct vpu_inst *inst)
>
>  static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *=
np)
>  {
> -       struct device_node *node;
>         struct resource res;
>         int ret;
>
> -       if (of_count_phandle_with_args(np, "memory-region", NULL) < 2) {
> -               dev_err(core->dev, "need 2 memory-region for boot and rpc=
\n");
> -               return -ENODEV;
> +       ret =3D of_reserved_mem_region_to_resource(np, 0, &res);
> +       if (ret) {
> +               dev_err(core->dev, "Cannot get boot-region\n");
> +               return ret;
>         }
>
> -       node =3D of_parse_phandle(np, "memory-region", 0);
> -       if (!node) {
> -               dev_err(core->dev, "boot-region of_parse_phandle error\n"=
);
> -               return -ENODEV;
> -       }
> -       if (of_address_to_resource(node, 0, &res)) {
> -               dev_err(core->dev, "boot-region of_address_to_resource er=
ror\n");
> -               of_node_put(node);
> -               return -EINVAL;
> -       }
>         core->fw.phys =3D res.start;
>         core->fw.length =3D resource_size(&res);
>
> -       of_node_put(node);
> -
> -       node =3D of_parse_phandle(np, "memory-region", 1);
> -       if (!node) {
> -               dev_err(core->dev, "rpc-region of_parse_phandle error\n")=
;
> -               return -ENODEV;
> -       }
> -       if (of_address_to_resource(node, 0, &res)) {
> -               dev_err(core->dev, "rpc-region of_address_to_resource err=
or\n");
> -               of_node_put(node);
> -               return -EINVAL;
> +       ret =3D of_reserved_mem_region_to_resource(np, 1, &res);
> +       if (ret) {
> +               dev_err(core->dev, "Cannot get rpc-region\n");
> +               return ret;
>         }
> +
>         core->rpc.phys =3D res.start;
>         core->rpc.length =3D resource_size(&res);
>
>         if (core->rpc.length < core->res->rpc_size + core->res->fwlog_siz=
e) {
>                 dev_err(core->dev, "the rpc-region <%pad, 0x%x> is not en=
ough\n",
>                         &core->rpc.phys, core->rpc.length);
> -               of_node_put(node);
>                 return -EINVAL;
>         }
>
> @@ -594,7 +577,6 @@ static int vpu_core_parse_dt(struct vpu_core *core, s=
truct device_node *np)
>         if (ret !=3D VPU_CORE_MEMORY_UNCACHED) {
>                 dev_err(core->dev, "rpc region<%pad, 0x%x> isn't uncached=
\n",
>                         &core->rpc.phys, core->rpc.length);
> -               of_node_put(node);
>                 return -EINVAL;
>         }
>
> @@ -606,8 +588,6 @@ static int vpu_core_parse_dt(struct vpu_core *core, s=
truct device_node *np)
>         core->act.length =3D core->rpc.length - core->res->rpc_size - cor=
e->log.length;
>         core->rpc.length =3D core->res->rpc_size;
>
> -       of_node_put(node);
> -
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/m=
edia/platform/qcom/iris/iris_firmware.c
> index f1b5cd56db32..40448429ba97 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -19,8 +19,7 @@ static int iris_load_fw_to_memory(struct iris_core *cor=
e, const char *fw_name)
>         u32 pas_id =3D core->iris_platform_data->pas_id;
>         const struct firmware *firmware =3D NULL;
>         struct device *dev =3D core->dev;
> -       struct reserved_mem *rmem;
> -       struct device_node *node;
> +       struct resource res;
>         phys_addr_t mem_phys;
>         size_t res_size;
>         ssize_t fw_size;
> @@ -30,17 +29,12 @@ static int iris_load_fw_to_memory(struct iris_core *c=
ore, const char *fw_name)
>         if (strlen(fw_name) >=3D MAX_FIRMWARE_NAME_SIZE - 4)
>                 return -EINVAL;
>
> -       node =3D of_parse_phandle(dev->of_node, "memory-region", 0);
> -       if (!node)
> -               return -EINVAL;
> -
> -       rmem =3D of_reserved_mem_lookup(node);
> -       of_node_put(node);
> -       if (!rmem)
> -               return -EINVAL;
> +       ret =3D of_reserved_mem_region_to_resource(dev->of_node, 0, &res)=
;
> +       if (ret)
> +               return ret;
>
> -       mem_phys =3D rmem->base;
> -       res_size =3D rmem->size;
> +       mem_phys =3D res.start;
> +       res_size =3D resource_size(&res);
>
>         ret =3D request_firmware(&firmware, fw_name, dev);
>         if (ret)
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media=
/platform/qcom/venus/firmware.c
> index 66a18830e66d..37c0fd52333e 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -9,7 +9,6 @@
>  #include <linux/iommu.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_device.h>
> @@ -83,8 +82,7 @@ static int venus_load_fw(struct venus_core *core, const=
 char *fwname,
>                          phys_addr_t *mem_phys, size_t *mem_size)
>  {
>         const struct firmware *mdt;
> -       struct reserved_mem *rmem;
> -       struct device_node *node;
> +       struct resource res;
>         struct device *dev;
>         ssize_t fw_size;
>         void *mem_va;
> @@ -94,15 +92,8 @@ static int venus_load_fw(struct venus_core *core, cons=
t char *fwname,
>         *mem_size =3D 0;
>
>         dev =3D core->dev;
> -       node =3D of_parse_phandle(dev->of_node, "memory-region", 0);
> -       if (!node) {
> -               dev_err(dev, "no memory-region specified\n");
> -               return -EINVAL;
> -       }
> -
> -       rmem =3D of_reserved_mem_lookup(node);
> -       of_node_put(node);
> -       if (!rmem) {
> +       ret =3D of_reserved_mem_region_to_resource(dev->of_node, 0, &res)=
;
> +       if (ret) {
>                 dev_err(dev, "failed to lookup reserved memory-region\n")=
;
>                 return -EINVAL;
>         }
> @@ -117,8 +108,8 @@ static int venus_load_fw(struct venus_core *core, con=
st char *fwname,
>                 goto err_release_fw;
>         }
>
> -       *mem_phys =3D rmem->base;
> -       *mem_size =3D rmem->size;
> +       *mem_phys =3D res.start;
> +       *mem_size =3D resource_size(&res);
>
>         if (*mem_size < fw_size || fw_size > VENUS_FW_MEM_SIZE) {
>                 ret =3D -EINVAL;
> --
> 2.47.2
>

