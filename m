Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48C436D58D
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 12:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239153AbhD1KPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 06:15:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:7666 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238964AbhD1KPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 06:15:46 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13SACeBX007948;
        Wed, 28 Apr 2021 10:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=I+MVSz17rMFhUANJ9vAyQofowEWDVcDjmcFL0J5BcrE=;
 b=uaOHEwiNVwraQynnCPG2JzUVkXn9TRJB98bwFw0nuDEWf2bDE8FmmhWwy27Gv5J3VgGA
 uewrbjmbZEziXm8mvrKV3ViaWtSgLiYoaaF42HTk3qioV7dpMwQvSgxqhLbQCkVd/3Fw
 LVJdAJMwZzS019v20hv+Fmbni5XnEu+n0Zh32LH6VtypyYkOVAkTHzHoCZo9BAHC59iD
 2k+gys9jMuwtzx/BQy+ly/lwxGeCA/WDfXiZIQN9VANI6J5sGWPFV0QM9JmSbGHuQcE6
 i6y9ZOrDpCpOAddMtZl/IOGGZmYnYPEWSyqoK+WyRvAh0cOfYCsePDN3Gw1Qw/s/HJKR fg== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 385p7j97m9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Apr 2021 10:14:17 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13SAEHeS049706;
        Wed, 28 Apr 2021 10:14:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 384b5884gd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Apr 2021 10:14:17 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13SAA2xH035177;
        Wed, 28 Apr 2021 10:14:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 384b5884e6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Apr 2021 10:14:15 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13SADmYk022121;
        Wed, 28 Apr 2021 10:13:48 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 28 Apr 2021 03:13:47 -0700
Date:   Wed, 28 Apr 2021 13:13:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Shawn Tu <shawnx.tu@intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, linuxarm@huawei.com,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, Jacopo Mondi <jacopo@jmondi.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-tegra@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Benoit Parrot <bparrot@ti.com>,
        Helen Koike <helen.koike@collabora.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        mauro.chehab@huawei.com,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
        Dan Scally <djrscally@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-renesas-soc@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 00/78] media: use pm_runtime_resume_and_get() instead of
 pm_runtime_get_sync()
Message-ID: <20210428101325.GS1981@kadam>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: Wh3TJZZgxDghGm9XGzqkDIkdKaJ9t1UU
X-Proofpoint-ORIG-GUID: Wh3TJZZgxDghGm9XGzqkDIkdKaJ9t1UU
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There was a Smatch check for these bugs.  This was a good source of
recurring Reported-by tags for me.  ;)  Thanks for doing this.

regards,
dan carpenter

