Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB679369B7F
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 22:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244019AbhDWUp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 16:45:59 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58584 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244004AbhDWUpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 16:45:52 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210423204511euoutp02bf02ff67ba6b89f0103adecb8ff0db87~4l5ARnue60075400754euoutp026
        for <linux-media@vger.kernel.org>; Fri, 23 Apr 2021 20:45:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210423204511euoutp02bf02ff67ba6b89f0103adecb8ff0db87~4l5ARnue60075400754euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619210711;
        bh=NBm0xRecla9MrLRvQiuvQHIGm/beN9+oBu9WKwOwc1U=;
        h=From:To:Cc:Subject:Date:References:From;
        b=hTn83j/KJh2sfkt7KpJWQ2bGZYXIhZsuBmAg8sxMP2LMKARObYfkrUmIGwyOJSeLS
         uAnK1rTcj2/TyWtOC2sJioyhOZ5z61out003Rdxgp/ldFwsQQI1nvyxyX/doK4tvsX
         OTHRQOpTVMzVxxgo2rnzpWYS2Q9U4aewo8DbcgeE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210423204510eucas1p2841fd539a5ceed73caef5a1436021e7a~4l4-VRtsE0622106221eucas1p2h;
        Fri, 23 Apr 2021 20:45:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F5.3A.09444.5D133806; Fri, 23
        Apr 2021 21:45:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210423204509eucas1p16ed651b17a096e10e8beb71d26614f66~4l4_pmVn60215802158eucas1p1k;
        Fri, 23 Apr 2021 20:45:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210423204509eusmtrp2338228e64b0bc4763a8503bf2307c408~4l4_o3iJV2289222892eusmtrp2U;
        Fri, 23 Apr 2021 20:45:09 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-71-608331d5b4aa
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id A5.1F.08705.5D133806; Fri, 23
        Apr 2021 21:45:09 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210423204508eusmtip111f37c746fcfdb11535809812d283bea~4l4_IyWHf1797917979eusmtip1L;
        Fri, 23 Apr 2021 20:45:08 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] media: s5p-mfc: Fix display delay control creation
Date:   Fri, 23 Apr 2021 22:44:57 +0200
Message-Id: <20210423204457.10300-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsWy7djP87pXDZsTDPa9trK4te4cq8XGGetZ
        LU5NfsZkcf78BnaLng1bWS1mnN/HZLH2yF12i2Wb/jBZtLQdYXLg9Ni0qpPN4861PWwefVtW
        MXp83iTncerrZ/YA1igum5TUnMyy1CJ9uwSujOd/3zIV/GCrWLllK2MD42vWLkZODgkBE4mJ
        F/+zdzFycQgJrGCUWHv2BCuE84VR4smFhcwQzmdGiTlNK4AcDrCWwwfKQLqFBJYzSjSeN4Nr
        WPukmQkkwSZgKNH1tosNxBYRcJJYOOsv2ApmgV1MEn8eXwUrEhZwlug5dZkZxGYRUJU4fHMF
        O4jNK2Ar8e/HbjaI++QlVm84AHaFhMBUDokVc3eyQyRcJNr+n2OEsIUlXh3fAhWXkfi/cz4T
        REMzo8TDc2vZIZweRonLTTOgOqwl7pz7xQbyD7OApsT6XfoQrzlKdD/0gzD5JG68FQQpZgYy
        J22bDvU8r0RHmxDEDDWJWcfXwW09eOESM4TtIfHu00NmSADFStw9vYxlAqPcLIRVCxgZVzGK
        p5YW56anFhvlpZbrFSfmFpfmpesl5+duYgSmh9P/jn/Zwbj81Ue9Q4xMHIyHGCU4mJVEeL2O
        NiYI8aYkVlalFuXHF5XmpBYfYpTmYFES503asiZeSCA9sSQ1OzW1ILUIJsvEwSnVwLTo954z
        Cw8lZdYITbT/PGn+m1j+lboOM9Tl5bL0Zi/mW77OSXN1U9nfitX7NDtY9wlW/j23dOO9lLfT
        Lkp/8rmxdnmH/e6ZGeHTNi+wyrpeG98rFZzfGye+QDGj7Ma9+4devq81nr70QIL8qxktzleb
        ok7pzHo4UVPoi8xsBn8zXo9erb4dn9PkH9ncsg4IUf/6YN/R5Y7vdZr3W9dOcn7nds3y9WRu
        mbP36ne9WvTmhOlCA2meXc4pz56fmdr95Euj9+3/FbnTtWtV2Q5On+GkpKzySZcnrfCR43x7
        zcNVS91nWm98yXvvklvdr+rTe4NdlzrmVJ95/62l7mKmpraWr+rf9al/O5ms3n/cfmuPEktx
        RqKhFnNRcSIAplmhv34DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrELMWRmVeSWpSXmKPExsVy+t/xu7pXDZsTDObu4rW4te4cq8XGGetZ
        LU5NfsZkcf78BnaLng1bWS1mnN/HZLH2yF12i2Wb/jBZtLQdYXLg9Ni0qpPN4861PWwefVtW
        MXp83iTncerrZ/YA1ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TU
        nMyy1CJ9uwS9jOd/3zIV/GCrWLllK2MD42vWLkYODgkBE4nDB8q6GLk4hASWMkr8+9XB3MXI
        CRSXkTg5rYEVwhaW+HOtiw2i6BOjxJ6uTWAJNgFDia63IAlODhEBF4n9e54ygxQxC+xjkmg5
        2cYOkhAWcJboOXUZbCqLgKrE4ZsrwOK8ArYS/37sZoPYIC+xesMB5gmMPAsYGVYxiqSWFuem
        5xYb6hUn5haX5qXrJefnbmIEBua2Yz8372Cc9+qj3iFGJg7GQ4wSHMxKIrxeRxsThHhTEiur
        Uovy44tKc1KLDzGaAu2byCwlmpwPjI28knhDMwNTQxMzSwNTSzNjJXHerXPXxAsJpCeWpGan
        phakFsH0MXFwSjUwefyQklj6fpGTJYfFkZiJjQsel+yd0r3WUHW30Ub+bQdtujzTnKvE5rzY
        7Fu8wCXp2Kb3YrlLz4Y8yt7CW7do280ZDTKX4/+pzlGb7Mv06sq/UslZuSstbY6rnQjKXHfQ
        qdKFI/xK2OZ7C1a5zZ2xg33+3yeX8y2FH5VcXPO68vSqgxULniSyVh+6vjTcS2VTlm6cicu+
        A3OEfsUIzZZXN2ybeWqiiuqcwA5DntTzGpkr1vnNuHPqVdNR5fqyM6lPD1yfabMyfvNVrdzC
        xmPMBzd/fWdzYWVmRNKLmVfeHq2/vnferID6mpI1N2bFnc8ItPXR9npXc+nYpYS27QoCOxdq
        9lx8f8X5w5difn3zhkNKLMUZiYZazEXFiQDDzgX41QIAAA==
X-CMS-MailID: 20210423204509eucas1p16ed651b17a096e10e8beb71d26614f66
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210423204509eucas1p16ed651b17a096e10e8beb71d26614f66
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210423204509eucas1p16ed651b17a096e10e8beb71d26614f66
References: <CGME20210423204509eucas1p16ed651b17a096e10e8beb71d26614f66@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_ctrl_new_std() fails if the caller provides no 'step' parameter for
integer control, so define it to fix following error:

s5p_mfc_dec_ctrls_setup:1166: Adding control (1) failed

Fixes: c3042bff918a ("media: s5p-mfc: Use display delay and display enable std controls")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
index a92a9ca6e87e..c1d3bda8385b 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
@@ -172,6 +172,7 @@ static struct mfc_control controls[] = {
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 16383,
+		.step = 1,
 		.default_value = 0,
 	},
 	{
-- 
2.17.1

