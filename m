Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D946794211
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 19:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243288AbjIFRca (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 13:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242862AbjIFRcZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 13:32:25 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 960771BC1
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 10:32:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-500c63c9625so10630e87.2
        for <linux-media@vger.kernel.org>; Wed, 06 Sep 2023 10:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694021529; x=1694626329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Faf197ap58+uI4FaNirUJNIB8FfxXIHwVOAyYDFccMo=;
        b=o8e2w79mJuGoB7piyOzigx4oTmvyk/Dl6DyfWwzV3TjnHczAnqJKYyFRmEy2KFd3LN
         ADPc6+FWvwIJPXyExSVFlQI0W2msYA0Oq//FKEA49TVn4j1LELe8DjPKYo9pZfdf03b3
         eTQ7KYamv2KBnw3m3HVnGXWGL6LOriCdtgGEPNrHWNrmO42C6E94N7hVU56taoEEY0RQ
         KX8mcjS6Qx5RUK/zWb2uoJxDuIauY2j5D0rvr+nN+gggBt3IkJGM2fwqInGxkIMK5y91
         mB6Ofmtawgp5YNSpRbFcgKCoDOhArWfc/C4HtzgA0FdCNIs5nMrl613OzltJejtha1Pg
         f8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694021529; x=1694626329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Faf197ap58+uI4FaNirUJNIB8FfxXIHwVOAyYDFccMo=;
        b=DgJELuUCtTZTqtsVF8qQZIA4pK90AzxKHSKZDgXyTNIe/ilujqJUNDbH2P1zdohTEH
         w2m5IR48+4POq3MoZehGncT/EWGWUjatLePe0eSjbP5carG/fiTmnqGdB9vmxQaj8aqc
         fLJCmQgTOQ0ouATObB6xu8VtjzsmhXmYOzjXleaysYZyYykpzfBWM+0IUEPpf1pnsepA
         F+7YIHiTitBjOj1UuZTgoMFRS1yzBqRR33k5Igr8jxkxP2O7K6+v35jwJNg1H4MGn4/L
         75iARyqjEQHgYP5qbGlbrkhQDRKiOBChbQtwqzHBMOg0vcXYaW6Yjdcv4Se0cywCzOtB
         SGkg==
X-Gm-Message-State: AOJu0Yx8ztsEjZ6h0YqhRTfLKGnHh7wWl0wdenzx3KUgve5I9lRMk047
        Zf3J/EdHohE7eq2kHK3zCZCKKkrHVgtjadJZ+1Bunw==
X-Google-Smtp-Source: AGHT+IE/xRN6VmZoaZ3/LQybPH9SnvALv5OkW+FNw4aOSnZk0lP+hWg4VBqn1530qyxOE1DKdructQX/EcvWMQr3aUE=
X-Received: by 2002:a05:6512:2399:b0:4fd:f84f:83c1 with SMTP id
 c25-20020a056512239900b004fdf84f83c1mr3286553lfv.64.1694021528640; Wed, 06
 Sep 2023 10:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <ZPiuH+ghqamtwJGA@vinayak-ubuntu>
In-Reply-To: <ZPiuH+ghqamtwJGA@vinayak-ubuntu>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 6 Sep 2023 23:01:57 +0530
Message-ID: <CAO_48GGbrgV7grhuWt448ZcTKUvt6d_3zVjVF5wm-8=ZWn_C6g@mail.gmail.com>
Subject: Re: [PATCH v2] Remove the parameter not described warning
To:     Vinayak Hegde <vinayakph123@gmail.com>
Cc:     gustavo@padovan.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vinayak,

On Wed, 6 Sept 2023 at 22:21, Vinayak Hegde <vinayakph123@gmail.com> wrote:
>
> I encountered a warning during kernel documentation compilation
> due to a missing colon in the documentation for the
> 'num_fences' variable in the sync_file.h header file.
> This change adds the missing colon to align with the documentation format=
.
>
> Signed-off-by: Vinayak Hegde <vinayakph123@gmail.com>
Thanks for your patch; I'll queue it via drm-misc.
> ---
>  include/uapi/linux/sync_file.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_fil=
e.h
> index 7e42a5b7558b..b389a5495181 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -56,7 +56,7 @@ struct sync_fence_info {
>   * @name:      name of fence
>   * @status:    status of fence. 1: signaled 0:active <0:error
>   * @flags:     sync_file_info flags
> - * @num_fences number of fences in the sync_file
> + * @num_fences: number of fences in the sync_file
>   * @pad:       padding for 64-bit alignment, should always be zero
>   * @sync_fence_info: pointer to array of struct &sync_fence_info with al=
l
>   *              fences in the sync_file
> --
> 2.34.1
>

Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
