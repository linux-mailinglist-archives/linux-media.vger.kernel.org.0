Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D4F6EF405
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 14:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240547AbjDZMJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 08:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240263AbjDZMJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 08:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9638F4C06
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 05:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682510939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IV7e9GGOdNbALKKLab/ykBXa8Km28X43nTNspyJKM/g=;
        b=eHCwXlM4EyKR+S+X5CPrU4MFp+lOMiI0wW0GelbmkMn6crJ5GSLkVNSs0+zzb9u6e0iJKP
        qrWggP3MDhk4DVmzR1gklst3by1NGQebLT0OH7lZEOLMrA+p1CT9Ft4pm+YTcPvfZML3FT
        8x4URK4gESwdkwM24Y2kzD9eH7jK4nw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-xg5b7ijgPEyP2SB4TX0ENQ-1; Wed, 26 Apr 2023 08:08:58 -0400
X-MC-Unique: xg5b7ijgPEyP2SB4TX0ENQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-506e62603f6so6823478a12.2
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 05:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682510937; x=1685102937;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IV7e9GGOdNbALKKLab/ykBXa8Km28X43nTNspyJKM/g=;
        b=f27v8EFkAxxBOE5uN20z7GcUxCPwLD4Xgq5uMc/ZKS+aGoJfUuZdJ/N4WK9G9OiFrR
         lUiPlDnXzpYQSCOr3NFoZYAbIopns74WiqdS6JqYmQggD8Zl5Mq2hdNgfLm0XqBWJWva
         SNIc8p2SAL3ap8qruiJaw6ItNHhuc19wLLUfPaHhJwJVFSWdshLHNZRuaQDa+8BpgW6E
         5Mf5YyTAhlD0gJu57PwjEjKO5i5r7a3Yie6hHAjHvfAEVpNtrfAmSytT2BPPKNCr+tw5
         kAyYkCGvor4te86BRyIPk9W3ju805S5inPaQVVzNQhE7KmadPVC+6DHTQHmU+1nIAFfX
         9F7w==
X-Gm-Message-State: AAQBX9evsXySUFwCcHAJKoTHzd3AYTcLAAgzXA0m1CVmjhdhmg3bqTz3
        4dXgp52NKnVStzBM7JNO80kWu2Cwfq0DuH3k1zoiR6WwfQ5Enq+cQPjseewhKCSst5iwrL5/u5x
        C0i1/9WiPqW8HjzOuHO+PzyBYrzzkjQE=
X-Received: by 2002:a17:907:b60f:b0:94f:2a13:4df6 with SMTP id vl15-20020a170907b60f00b0094f2a134df6mr19835750ejc.36.1682510937222;
        Wed, 26 Apr 2023 05:08:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350YHAGgcWduH8zCy8/emaktjTBZ7NP3CGMwi4GryC57EkXZIedYMtWbyeS+LCOqgjSaTB1cJ9w==
X-Received: by 2002:a17:907:b60f:b0:94f:2a13:4df6 with SMTP id vl15-20020a170907b60f00b0094f2a134df6mr19835727ejc.36.1682510936952;
        Wed, 26 Apr 2023 05:08:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906bc4c00b00947ed087a2csm8142902ejv.154.2023.04.26.05.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 05:08:56 -0700 (PDT)
Message-ID: <ae16c0b7-93a6-67b3-2a20-683d808ba636@redhat.com>
Date:   Wed, 26 Apr 2023 14:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/5] staging: media: atomisp: sh_css_firmware: determine
 firmware version at runtime
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230425074841.29063-1-hpa@redhat.com>
 <20230425074841.29063-5-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230425074841.29063-5-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 4/25/23 09:48, Kate Hsuan wrote:
> The firmware version of ISP2401 and 2400 is determined at runtime.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  .../media/atomisp/pci/sh_css_firmware.c        | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> index e7ef578db8ab..49ee88fe151d 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> @@ -56,11 +56,8 @@ static struct firmware_header *firmware_header;
>   * which will be replaced with the actual RELEASE_VERSION
>   * during package generation. Please do not modify
>   */
> -#ifdef ISP2401
> -static const char *release_version = STR(irci_stable_candrpv_0415_20150521_0458);
> -#else
> -static const char *release_version = STR(irci_stable_candrpv_0415_20150423_1753);
> -#endif
> +static const char *release_version_2401 = STR(irci_stable_candrpv_0415_20150521_0458);
> +static const char *release_version_2400 = STR(irci_stable_candrpv_0415_20150423_1753);
>  
>  #define MAX_FW_REL_VER_NAME	300
>  static char FW_rel_ver_name[MAX_FW_REL_VER_NAME] = "---";
> @@ -191,8 +188,14 @@ sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
>  bool
>  sh_css_check_firmware_version(struct device *dev, const char *fw_data)
>  {
> +	const char *release_version;
>  	struct sh_css_fw_bi_file_h *file_header;
>  
> +	if (IS_ISP2401)
> +		release_version = release_version_2401;
> +	else
> +		release_version = release_version_2400;
> +
>  	firmware_header = (struct firmware_header *)fw_data;
>  	file_header = &firmware_header->file_header;
>  
> @@ -225,6 +228,7 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
>  		     unsigned int fw_size)
>  {
>  	unsigned int i;
> +	const char *release_version;
>  	struct ia_css_fw_info *binaries;
>  	struct sh_css_fw_bi_file_h *file_header;
>  	int ret;
> @@ -234,6 +238,10 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
>  	binaries = &firmware_header->binary_header;
>  	strscpy(FW_rel_ver_name, file_header->version,
>  		min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
> +	if (IS_ISP2401)
> +		release_version = release_version_2401;
> +	else
> +		release_version = release_version_2400;
>  	ret = sh_css_check_firmware_version(dev, fw_data);
>  	if (ret) {
>  		IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) mismatch!",

