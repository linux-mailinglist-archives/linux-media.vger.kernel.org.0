Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE7F7712610
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 13:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjEZL4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 07:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjEZL4A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 07:56:00 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D16128
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 04:55:58 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f6dbe3c230so7123865e9.3
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685102157; x=1687694157;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ygrgpiWsTFJqLcqFddrpkStGcUioVYvfzia0SZL/7J4=;
        b=IOxhRWXNNwovz7D9wxK77JWd4gzPR5J8eTQVhvjbSJcwld62N++AJs5CanL/lBdLDZ
         vHjz3FCtCotqkZWeLPc/GNHClyJJ1HFzKRknPzXCfPAGBQXQmkcotNRYxy68JXDbbdqb
         OS940MzLCssiBmz8JTRVPdsv6PDxX5N7hglWSMTdT3h3KEhaZ55rgI/70nsdaJCufbVr
         jl2CkbjchmmLWRTWhcSM3dpcderpaefJPcMU09DmSw+U25WvHFJ9XGwc3EbJK+SUCWU+
         TICQQwnACt5uX8Ra83tDKvkQevvzJjUaHcbcsP7zbh3BQ+XFHEzY2XI8RMm5JkMkWK9j
         uOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685102157; x=1687694157;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygrgpiWsTFJqLcqFddrpkStGcUioVYvfzia0SZL/7J4=;
        b=lPujDSbRxcDZUpA7nWkBBNn51gprl52N9APqfWoK02/eD/wm5Y5ZusugTDzJbLjSGO
         IngyV9H3vFjX0Ha69Sru/sATiS6MC0SoUkZ3OzMwFJjjVc92glgP+SWZF4uSfMPrxALu
         nOnLQRpvqjNoqUHBegiUB8TzI0fAgE7kThfRP/iO2GRxoXU1rqh5ZC4DNyANYMSCPs15
         beQY69g/U0fahlcnQj7UqtbeOfPAOpXPK8ulekbg1HrhBn3FIYJ79woXcRMk6fMyZxdh
         3LySDkYitnTLn4hx9v+aYGQIrEdBeBvbc+Suv2cVz3RSs2WS8i2yoh1o4kRRJnYfE3nf
         XFJg==
X-Gm-Message-State: AC+VfDzjSbdz3kbpF0o7r+sR9JpU1Ut8i+ekJs97RKCc1GBnEFLwcIq0
        iDeYYAqmvqlSWD2Ds7/y6aN4WVnaUm3E3UQQH90=
X-Google-Smtp-Source: ACHHUZ5pzLbsMFYPXyl/+Umm4srC8421MzSJ42zwnh2NmIa9hic1piwvUp9zpoO3CrXagQuCGzwxGw==
X-Received: by 2002:a05:600c:2042:b0:3f4:2e13:ccdc with SMTP id p2-20020a05600c204200b003f42e13ccdcmr1513920wmg.0.1685102156985;
        Fri, 26 May 2023 04:55:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v10-20020adfe28a000000b003063a1cdaf2sm4796842wri.48.2023.05.26.04.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 04:55:55 -0700 (PDT)
Date:   Fri, 26 May 2023 14:55:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: atomisp: remove some trivial wrappers from
 compat css20
Message-ID: <d89e5638-be36-477c-b589-fba23e225fa7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Atomisp devs,

This is a semi-automatic email about new static checker warnings.

The patch 1a16d5453978: "media: atomisp: remove some trivial wrappers 
from compat css20" from May 28, 2020, leads to the following Smatch 
complaint:

    drivers/staging/media/atomisp/pci/sh_css_firmware.c:247 sh_css_load_firmware()
    warn: variable dereferenced before check 'fw_data' (see line 237)

drivers/staging/media/atomisp/pci/sh_css_firmware.c
   236			min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
   237		ret = sh_css_check_firmware_version(dev, fw_data);
                                                         ^^^^^^^
Dereferenced.

   238		if (ret) {
   239			IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) mismatch!",
   240				     file_header->version, release_version);
   241			return -EINVAL;
   242		} else {
   243			IA_CSS_LOG("successfully load firmware version %s", release_version);
   244		}
   245	
   246		/* some sanity checks */
   247		if (!fw_data || fw_size < sizeof(struct sh_css_fw_bi_file_h))
                     ^^^^^^^
Too late.

   248			return -EINVAL;
   249	

regards,
dan carpenter
