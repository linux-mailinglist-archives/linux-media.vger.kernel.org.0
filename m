Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAF7736708
	for <lists+linux-media@lfdr.de>; Tue, 20 Jun 2023 11:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbjFTJJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jun 2023 05:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbjFTJJi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jun 2023 05:09:38 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0193C10FB
        for <linux-media@vger.kernel.org>; Tue, 20 Jun 2023 02:09:27 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f9002a1a39so28539225e9.2
        for <linux-media@vger.kernel.org>; Tue, 20 Jun 2023 02:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687252166; x=1689844166;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QobURTtvsdT4hQ46NtZvWGpz7h6PSgzwiUF9rdibf2s=;
        b=zEfVwGfo7k1TDvVN6CxuMarMQ98jnVbAH5viJRUtzPMGwyMCSjznRxxc2YxGF9XjkU
         9lU+w2ia7ScVoq+gXX6GDlNSpmeoJize9WLf5FPt2j2DbulqUoIC9EeuliDSl3bKbbOI
         fEtpVX4gtwBTR9UKuzALS2/aSpVh0pWYxFbs9/U4joLB1bD7rz7dYOCdUD37lz4IaIBd
         hXd7fa8fJoDP+KU++loxxAth/y8KmxKT7KI47ocKNohR0NJts4/CeOeu8+mz0woyYIdk
         E1Tmm7ndvwdfoCY2FbdNFSHZyKxWkCf1XslVI+KkTkQXhOPtEFK/RiDjs+WlN/J5A8S1
         M6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687252166; x=1689844166;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QobURTtvsdT4hQ46NtZvWGpz7h6PSgzwiUF9rdibf2s=;
        b=JRBWaMnU4dFpkOYlY9J7C/3tiGZzkzCh5TXcR6aLmzg9GdMY1ambaUrTGASErF3ap1
         c3vAMBK8x+X0ZoxYfHOu+BPx8886KVAVff5/Z/fcA9Q3FSM73oyeb5BeC7IOEmCxNTam
         T9w38mUNIgRHDwOZzkhNpH8V3oHCD8Uin7QlgxLjidj5H4x5H2PmRYs4vxBv4535Pl15
         b0kjaqL/IhTVW9qdgacN68nfXOXYqgnR+RCBiJTvnZAnJqEBmQHI/yfzPq6ctUxM5JVI
         Hkfv6v+xtxA5qmGwi/6kA7tosa9m4TyykdCMEGUsl9fVqZASYCc5Zgptixx0ll03PNoN
         DDhg==
X-Gm-Message-State: AC+VfDxH5tKqiqgmJpsfpwBGTkKngrimuHFirGqlGxm5pIEWF/FcxFNC
        GC2AUSsNxznKV//m5xFS48561SOJLb73Ge91B/A=
X-Google-Smtp-Source: ACHHUZ5AWzHMCXbVwQxlBZGAi4JrcBwLplBOAq7WNHjAol+CBiU6ZsgVvCqu3r6iAnn76MhgboIAKg==
X-Received: by 2002:a7b:c396:0:b0:3f9:503:5349 with SMTP id s22-20020a7bc396000000b003f905035349mr5415999wmj.23.1687252166383;
        Tue, 20 Jun 2023 02:09:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g18-20020a7bc4d2000000b003f8d0308604sm13008073wmk.9.2023.06.20.02.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 02:09:24 -0700 (PDT)
Date:   Tue, 20 Jun 2023 12:09:20 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     tangbin@cmss.chinamobile.com
Cc:     linux-media@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [bug report] venus: pm_helpers: Fix error check in
 vcodec_domains_get()
Message-ID: <10b5238b-3dff-4666-b18e-07c8fc41abaf@moroto.mountain>
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

Hello Tang Bin,

The patch 0f6e8d8c94a8: "venus: pm_helpers: Fix error check in
vcodec_domains_get()" from Sep 13, 2022, leads to the following
Smatch static checker warning:

	drivers/media/platform/qcom/venus/pm_helpers.c:873 vcodec_domains_get()
	warn: passing zero to 'PTR_ERR'

drivers/media/platform/qcom/venus/pm_helpers.c
    857 static int vcodec_domains_get(struct venus_core *core)
    858 {
    859         int ret;
    860         struct device **opp_virt_dev;
    861         struct device *dev = core->dev;
    862         const struct venus_resources *res = core->res;
    863         struct device *pd;
    864         unsigned int i;
    865 
    866         if (!res->vcodec_pmdomains_num)
    867                 goto skip_pmdomains;
    868 
    869         for (i = 0; i < res->vcodec_pmdomains_num; i++) {
    870                 pd = dev_pm_domain_attach_by_name(dev,
    871                                                   res->vcodec_pmdomains[i]);
    872                 if (IS_ERR_OR_NULL(pd))
--> 873                         return PTR_ERR(pd) ? : -ENODATA;

This is wrong.  It should be if (IS_ERR(pd)).  Now venus_probe() will
fail if CONFIG_PM is disabled where before it would succeed.

When a function returns both error pointers and NULL then the NULL
should be treated as success.  If it is not possible to succeed when a
feature is disabled then that should be enforced by the Kconfig
dependencies.  Checking for if CONFIG_PM is disabled and erroring out
at runtime is not user friendly.

Please read my blog for more details.
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

Also this error path should release resources instead of returning
directly.

    874                 core->pmdomains[i] = pd;
    875         }
    876 
    877 skip_pmdomains:
    878         if (!core->res->opp_pmdomain)
    879                 return 0;
    880 
    881         /* Attach the power domain for setting performance state */
    882         ret = devm_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
    883         if (ret)
    884                 goto opp_attach_err;
    885 
    886         core->opp_pmdomain = *opp_virt_dev;
    887         core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
    888                                              DL_FLAG_RPM_ACTIVE |
    889                                              DL_FLAG_PM_RUNTIME |
    890                                              DL_FLAG_STATELESS);
    891         if (!core->opp_dl_venus) {
    892                 ret = -ENODEV;
    893                 goto opp_attach_err;
    894         }
    895 
    896         return 0;
    897 
    898 opp_attach_err:
    899         for (i = 0; i < res->vcodec_pmdomains_num; i++) {
    900                 if (IS_ERR_OR_NULL(core->pmdomains[i]))

This one is okay because core->pmdomains[i] could be NULL because it
was never initialized.

    901                         continue;
    902                 dev_pm_domain_detach(core->pmdomains[i], true);
    903         }
    904 
    905         return ret;
    906 }

regards,
dan carpenter
