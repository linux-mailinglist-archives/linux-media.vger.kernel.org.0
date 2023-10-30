Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4DC77DBF1C
	for <lists+linux-media@lfdr.de>; Mon, 30 Oct 2023 18:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbjJ3RhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Oct 2023 13:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbjJ3RhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Oct 2023 13:37:12 -0400
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16855F9
        for <linux-media@vger.kernel.org>; Mon, 30 Oct 2023 10:37:04 -0700 (PDT)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39UCvvTF018738;
        Mon, 30 Oct 2023 18:36:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        date:from:to:cc:subject:message-id:mime-version:content-type; s=
        selector1; bh=23HM2u7jeb6jtCQrf7VzCq3uuhB1wah5kVMk1YjE0fE=; b=Xm
        NLfe0WQETE9+ogCt6phpJ/IPfQqSsIuahyxdVv9f7ZRzvpnfHokF1kVXZVogVgjI
        tjE9Zjb7KQoaN9vld6c9xAjP3C3oMUR/FxoYcSlhEXAtchMH44dWTc7DkdMh/9NV
        PWIZE0t0AtktJ0liwAhClOvqZ0qD8Fj3hqf6fxb8H4Y5d2tdvwVAskwqm9PMy/3a
        YGQ/9RMADvpC+A1bB1Qb5Rc+3rrKFk0ctl7kH5m0c2XWMQnyqJIR6ccgah4NEbeE
        XFr9kaeI6IvjGETIZkjZIvyp30liqAbtLVwCSf6Eo8AVMC2ESiYkT3ZkdFgtatL5
        l68pjAmB4LQurKy3L7YQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u1d8hepfn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Oct 2023 18:36:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D51A100034;
        Mon, 30 Oct 2023 18:36:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8978B2A19CA;
        Mon, 30 Oct 2023 18:36:52 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 30 Oct
 2023 18:36:52 +0100
Date:   Mon, 30 Oct 2023 18:36:37 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <linux-media@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>
Subject: [RFC] regmap_range_cfg usage with v4l2-cci
Message-ID: <20231030173637.GA2977515@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_11,2023-10-27_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Goal of this email is to get first comments prior to posting a patch.

Could we consider enhancements within the v4l2-cci in order to also
allow regmap_range_cfg usage for paged register access ?

At least two drivers currently being upstream and using v4l2-cci infrastructure
could benefit from regmap_range_cfg.
The GC0308 driver is partially using v4l2-cci and partially regmap (in order to use
regmap_range_cfg) and the GC2145 driver is using v4l2-cci but doing paging manually.

The function devm_cci_regmap_init_i2c is already taking as parameter one argument
reg_addr_bits to be used in the regmap_config structure.  We could also add
regmap_range_cfg pointer and size arguments to the function or
alternatively add another init function with more arguments ?

Regards
Alain
