Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 249C656C038
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 20:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239528AbiGHQyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 12:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239497AbiGHQyH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 12:54:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D7784EC1
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 09:53:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 69522B828B5
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 16:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28317C341C6
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657299220;
        bh=e/ks7jIV/meRuI24+cF4GLfYBkTYHbCIi+q2l6ASFXo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o3Mj043U5KWUst8PkP7/+i8E+giCuJixZ29CGxqFIkhjPp4Du4kKQpE0BlkbPIFcm
         bhF8ngqm67HNzhQnUT289uBZDtYGjRKERnrvAfCEPQFxivnj/BPxZ2LHDmsalFwsAz
         CEEiOImUnQ1xFXebgOoUihWG/IL59WxnjVYWw67PVYXoDfZItPVl2D9ELvMMPDEKrr
         F4mF1kY3XfEFyHu6j1TvD+xJGOWJiW5e5tS/tVKSJXX2ucrMmQ35ZiwMIab4p3sGsG
         pBnfgdGddw6i4+SCNr5Xlxy4aLrd7IlfYA1DnVc4ibileWyqJzym4DsU1XW/uUAzfE
         REDwWloZWeFrA==
Received: by mail-oi1-f169.google.com with SMTP id o133so3733421oig.13
        for <linux-media@vger.kernel.org>; Fri, 08 Jul 2022 09:53:40 -0700 (PDT)
X-Gm-Message-State: AJIora8VZ0ssuZOpK6gnBtEdkL8HU1cVWSGQVEgvfyxWr/OEwOi51mLz
        ixvoVOBnGFte5pzWmbB8JbfSTH6rZWm3SbKVdyU=
X-Google-Smtp-Source: AGRyM1sEUTbjTd87xfCgoFLtiR/3l+kbqk3BjzCERbGfpgDPTPBlm4S97HYEoWTPIHsak+Z0r5/P/h6hE6AeYswATZ4=
X-Received: by 2002:aca:d78a:0:b0:339:d862:bcae with SMTP id
 o132-20020acad78a000000b00339d862bcaemr425086oig.228.1657299219270; Fri, 08
 Jul 2022 09:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <E1o9rBq-002Vup-Ee@www.linuxtv.org>
In-Reply-To: <E1o9rBq-002Vup-Ee@www.linuxtv.org>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 8 Jul 2022 18:53:28 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEzv8T70gEZjXK3L4-UVfq5gOoDJQ8a=Vc5uk+2hBb3Cw@mail.gmail.com>
Message-ID: <CAMj1kXEzv8T70gEZjXK3L4-UVfq5gOoDJQ8a=Vc5uk+2hBb3Cw@mail.gmail.com>
Subject: Re: [git:media_stage/master] media: atomisp_gmin_platform: stop
 abusing efivar API
To:     linux-media@vger.kernel.org
Cc:     linuxtv-commits@linuxtv.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Fri, 8 Jul 2022 at 18:50, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> This is an automatic generated email to let you know that the following patch were queued:
>
> Subject: media: atomisp_gmin_platform: stop abusing efivar API
> Author:  Ard Biesheuvel <ardb@kernel.org>
> Date:    Mon Jun 20 11:08:19 2022 +0100
>

This patch has been queued up in the efi/next tree, and has also
appeared in linux-next, since 20 June, more or less.


> As the code comment already suggests, using the efivar API in this way
> is not how it is intended, and so let's switch to the right one, which
> is simply to call efi.get_variable() directly after checking whether or
> not the GetVariable() runtime service is supported.
>
> Link: https://lore.kernel.org/linux-media/20220620100819.1682995-1-ardb@kernel.org
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>  .../media/atomisp/pci/atomisp_gmin_platform.c      | 27 +++++-----------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
>
> ---
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 7e47db82de07..bf527b366ab3 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1284,7 +1284,7 @@ static int gmin_get_config_var(struct device *maindev,
>         const struct dmi_system_id *id;
>         struct device *dev = maindev;
>         char var8[CFG_VAR_NAME_MAX];
> -       struct efivar_entry *ev;
> +       efi_status_t status;
>         int i, ret;
>
>         /* For sensors, try first to use the _DSM table */
> @@ -1326,24 +1326,11 @@ static int gmin_get_config_var(struct device *maindev,
>         for (i = 0; i < sizeof(var8) && var8[i]; i++)
>                 var16[i] = var8[i];
>
> -       /* Not sure this API usage is kosher; efivar_entry_get()'s
> -        * implementation simply uses VariableName and VendorGuid from
> -        * the struct and ignores the rest, but it seems like there
> -        * ought to be an "official" efivar_entry registered
> -        * somewhere?
> -        */
> -       ev = kzalloc(sizeof(*ev), GFP_KERNEL);
> -       if (!ev)
> -               return -ENOMEM;
> -       memcpy(&ev->var.VariableName, var16, sizeof(var16));
> -       ev->var.VendorGuid = GMIN_CFG_VAR_EFI_GUID;
> -       ev->var.DataSize = *out_len;
> -
> -       ret = efivar_entry_get(ev, &ev->var.Attributes,
> -                              &ev->var.DataSize, ev->var.Data);
> -       if (ret == 0) {
> -               memcpy(out, ev->var.Data, ev->var.DataSize);
> -               *out_len = ev->var.DataSize;
> +       status = EFI_UNSUPPORTED;
> +       if (efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE))
> +               status = efi.get_variable(var16, &GMIN_CFG_VAR_EFI_GUID, NULL,
> +                                         (unsigned long *)out_len, out);
> +       if (status == EFI_SUCCESS) {
>                 dev_info(maindev, "found EFI entry for '%s'\n", var8);
>         } else if (is_gmin) {
>                 dev_info(maindev, "Failed to find EFI gmin variable %s\n", var8);
> @@ -1351,8 +1338,6 @@ static int gmin_get_config_var(struct device *maindev,
>                 dev_info(maindev, "Failed to find EFI variable %s\n", var8);
>         }
>
> -       kfree(ev);
> -
>         return ret;
>  }
>
