Return-Path: <linux-media+bounces-2192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FB80E429
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 07:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B632F1F21F40
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 06:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F9A156F8;
	Tue, 12 Dec 2023 06:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkuV3QZP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3212A6
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 22:08:01 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54ca43031d1so5006350a12.0
        for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 22:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702361280; x=1702966080; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=axo93PU/AwTL1BOD2oRahdvggPYpm3je5ofGEuPWsVg=;
        b=WkuV3QZPihgraAa4LNp3Hn65ReCG17wJruADFsFMlKl/pf8e/jiQ4gCSbynqsU4o0K
         lwW46qwJ8VUtufJuHTISwugudKTYG2p2Jj9x67WSKEsA0TEhSV0U1RfcE1wwOlCEEANI
         zQGhozHsAjV8xyXPyCBRVNE8taNQ0U4DrkictY5cNCkPIBtIZvcirEetnKqhYGltY9iO
         aa3sCm8dgxdwZSyjkFbfZ2VY5aiAZw8GnjY3zDJ8UA54Z3V7yxjpq93TnmE11ju9CUJZ
         zEc4iEvhdvx7KQqaoRyplsnb2pcIJWA8Zs+kSDxdmgDj/7hQfT7xO+7wOHse9c76oLfJ
         6VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702361280; x=1702966080;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=axo93PU/AwTL1BOD2oRahdvggPYpm3je5ofGEuPWsVg=;
        b=p+fLb/zXLHcWSYk8+7HoMoe1X5c9EZfdVMkgz1rik+iF/icPiALSfP2dpTh/+16W5Q
         v+LVyO4XT6ujaB7onD9fzclsXNb66zX2SALHNptl8b5Deo5IuEIjziJN43mI4PZZZ0HM
         Fs0+qmi6SClSwdz1p8fqpJ9LHHrEx/M5sXSfJp1AoS/gG+Gx8vq7stf9R+7pxxTCQ/3T
         OOhtCmCwW5iS1Lc+EGpBhKlu+c0C4DoNdtuSFIdwHTj/N7M1p9wRxaKbQe3tMJY2E2sz
         yg0c958TMtC6QDaYqnGnhzhadDxGwM81bUG+qfK3qyf6cLNWF9/rCaEvCp0Z1MiQrOaN
         5IDA==
X-Gm-Message-State: AOJu0YyjQ80AxwARUiSswszQgY1JQwblFYdDAs/ki3hcKSH7eC6fZzZ3
	4z43UIzV6Pu/dDCqRJWrmXVavrf3FtYeBkomEr1HiA==
X-Google-Smtp-Source: AGHT+IE0rDjqzHkOkiuMBuRJWlDNwArZ3NUeis2kHmesSPPkx18r4nd1AXgeNMm1jY/EWGpDKnNBpw==
X-Received: by 2002:a50:d71b:0:b0:551:8349:c1c with SMTP id t27-20020a50d71b000000b0055183490c1cmr185697edi.74.1702361280005;
        Mon, 11 Dec 2023 22:08:00 -0800 (PST)
Received: from localhost (h3220.n1.ips.mtn.co.ug. [41.210.178.32])
        by smtp.gmail.com with ESMTPSA id p13-20020a50c94d000000b0054dc979e31fsm4342955edh.2.2023.12.11.22.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 22:07:59 -0800 (PST)
Date: Tue, 12 Dec 2023 09:07:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: bryan.odonoghue@linaro.org
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: qcom: camss: Move VFE power-domain specifics
 into vfe.c
Message-ID: <5a375f6c-3604-4457-ad02-689987660094@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Bryan O'Donoghue,

The patch 23aa4f0cd327: "media: qcom: camss: Move VFE power-domain
specifics into vfe.c" from Nov 23, 2023 (linux-next), leads to the
following Smatch static checker warning:

	drivers/media/platform/qcom/camss/camss.c:1572 camss_configure_pd()
	error: 'camss->genpd' dereferencing possible ERR_PTR()

drivers/media/platform/qcom/camss/camss.c
    1495 static int camss_configure_pd(struct camss *camss)
    1496 {
    1497         const struct camss_resources *res = camss->res;
    1498         struct device *dev = camss->dev;
    1499         int vfepd_num;
    1500         int i;
    1501         int ret;
    1502 
    1503         camss->genpd_num = of_count_phandle_with_args(dev->of_node,
    1504                                                       "power-domains",
    1505                                                       "#power-domain-cells");
    1506         if (camss->genpd_num < 0) {
    1507                 dev_err(dev, "Power domains are not defined for camss\n");
    1508                 return camss->genpd_num;
    1509         }
    1510 
    1511         /*
    1512          * If a platform device has just one power domain, then it is attached
    1513          * at platform_probe() level, thus there shall be no need and even no
    1514          * option to attach it again, this is the case for CAMSS on MSM8916.
    1515          */
    1516         if (camss->genpd_num == 1)
    1517                 return 0;
    1518 
    1519         /* count the # of VFEs which have flagged power-domain */
    1520         for (vfepd_num = i = 0; i < camss->res->vfe_num; i++) {
    1521                 if (res->vfe_res[i].has_pd)
    1522                         vfepd_num++;
    1523         }
    1524 
    1525         /*
    1526          * If the number of power-domains is greater than the number of VFEs
    1527          * then the additional power-domain is for the entire CAMSS block.
    1528          */
    1529         if (!(camss->genpd_num > vfepd_num))
    1530                 return 0;
    1531 
    1532         /*
    1533          * If a power-domain name is defined try to use it.
    1534          * It is possible we are running a new kernel with an old dtb so
    1535          * fallback to indexes even if a pd_name is defined but not found.
    1536          */
    1537         if (camss->res->pd_name) {
    1538                 camss->genpd = dev_pm_domain_attach_by_name(camss->dev,
    1539                                                             camss->res->pd_name);
    1540                 if (IS_ERR(camss->genpd)) {
    1541                         ret = PTR_ERR(camss->genpd);
    1542                         goto fail_pm;

camss->genpd is an error pointer here

    1543                 }
    1544         }
    1545 
    1546         if (!camss->genpd) {
    1547                 /*
    1548                  * Legacy magic index. TITAN_TOP GDSC must be the last
    1549                  * item in the power-domain list.
    1550                  */
    1551                 camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
    1552                                                           camss->genpd_num - 1);
    1553         }
    1554         if (IS_ERR_OR_NULL(camss->genpd)) {

This can only be NULL if CONFIG_PM is disabled.  Generally, the
guidelines here would be to say that we should allow the driver to work
without CONFIG_PM.  In other words, add NULL checks as necessary.  I
only looked at this file and camss-vfe.c.  This file doesn't need any
NULL checks and camss-vfe.c already seems to have appropriate NULL
checking.

But if this driver really can't work without CONFIG_PM then the correct
thing is to add a dependency to the Kconfig.  Waiting until probe to
check for NULL and then refusing is wrong.

    1555                 if (!camss->genpd)
    1556                         ret = -ENODEV;
    1557                 else
    1558                         ret = PTR_ERR(camss->genpd);
    1559                 goto fail_pm;
    1560         }
    1561         camss->genpd_link = device_link_add(camss->dev, camss->genpd,
    1562                                             DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
    1563                                             DL_FLAG_RPM_ACTIVE);
    1564         if (!camss->genpd_link) {
    1565                 ret = -EINVAL;
    1566                 goto fail_pm;
    1567         }
    1568 
    1569         return 0;
    1570 
    1571 fail_pm:
--> 1572         dev_pm_domain_detach(camss->genpd, true);
                                      ^^^^^^^^^^^^
The error pointer will crash here.  (NULL is not an issue because in
that situation dev_pm_domain_detach() is a no-op).

    1573 
    1574         return ret;
    1575 }

regards,
dan carpenter

