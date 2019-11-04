Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6B5EDBF9
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 10:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbfKDJ5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 04:57:43 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33032 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfKDJ5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 04:57:42 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191104095741euoutp02a8182068d791287af6b2273554c2815a~T7Spq11eI0872708727euoutp02w
        for <linux-media@vger.kernel.org>; Mon,  4 Nov 2019 09:57:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191104095741euoutp02a8182068d791287af6b2273554c2815a~T7Spq11eI0872708727euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1572861461;
        bh=aKYmWHn5rk8z/w3sM8htZFwNA+g0GxNvmU1BcW1DIZI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=JEm4uTRUwOY1yT7zRFrH/a8V4iXRZRW7f8EqBlkbWv0ZIyGtFGVFubNtQKumO2WJb
         +derHLWc3gu3IdMGUgoLzbtHk1alNt/uzMECHNeL7nC6Yn90SoGF/JPXPs6Cf7P2cq
         1HR8m4pyBVuyJV+JpQ4oIJi2ek17JU1KloZ8BNeQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191104095741eucas1p14777153fe838beadd14be597e62a3843~T7Spg_HbA1734117341eucas1p1G;
        Mon,  4 Nov 2019 09:57:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 31.1D.04469.416FFBD5; Mon,  4
        Nov 2019 09:57:41 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191104095740eucas1p10cbb0cc5f6d857f06c0f4674c637ffbe~T7SpLsF1w1712717127eucas1p1_;
        Mon,  4 Nov 2019 09:57:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191104095740eusmtrp18f1e51019c0924b00b1d584501803c28~T7SpLAF3l1598615986eusmtrp1I;
        Mon,  4 Nov 2019 09:57:40 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-04-5dbff614c9b7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 2E.91.04117.416FFBD5; Mon,  4
        Nov 2019 09:57:40 +0000 (GMT)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191104095740eusmtip15867e3ceafb6e91132d5cda719eeda82~T7So3bqdL0225002250eusmtip1e;
        Mon,  4 Nov 2019 09:57:40 +0000 (GMT)
Subject: Re: [PATCH v2] media: exynos4-is: fix wrong mdev and v4l2 dev order
 in error path
To:     Seung-Woo Kim <sw0312.kim@samsung.com>, linux-media@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, mchehab@kernel.org,
        krzk@kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <88ff8e70-4bb0-cabe-aa3f-203714dc4b37@samsung.com>
Date:   Mon, 4 Nov 2019 10:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572860792-4471-1-git-send-email-sw0312.kim@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djPc7qi3/bHGvRuZrI4f34Du0XPhq2s
        FjPO72OyWLbpD5PFjMkv2RxYPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsErowlEzaw
        FmxmqWg5P4u5gfEicxcjJ4eEgInE6hkn2LoYuTiEBFYwShyYt4wZwvnCKNGydgojhPOZUeJF
        XycLTMvRHeeZIBLLGSVm7O6Cct4ySjxduQ2ohYNDWCBGon0mWIOIgLtE75l37CA2s4CXRMfu
        H2A2m4ChRO/RPkYQm1fATuLuhdVMIDaLgIrE3f+nWEDGiApESJz+mghRIihxcuYTsJGcAm4S
        s+5+Z4IYKS7R9GUlK4QtL7H97RywDyQEprNLnH6yCepoF4l/Hz+yQdjCEq+Ob2GHsGUkTk/u
        YYFoaGaU6Nl9mx3CmcAocf/4AkaIKmuJw8cvsoJcxCygKbF+lz5E2FHi7ek1YIdKCPBJ3Hgr
        CHEEn8SkbdOZIcK8Eh1tQhDVKhK/V01ngrClJLqf/GeZwKg0C8lrs5C8MwvJO7MQ9i5gZFnF
        KJ5aWpybnlpsmJdarlecmFtcmpeul5yfu4kRmFpO/zv+aQfj10tJhxgFOBiVeHgdePbHCrEm
        lhVX5h5ilOBgVhLhvThjb6wQb0piZVVqUX58UWlOavEhRmkOFiVx3mqGB9FCAumJJanZqakF
        qUUwWSYOTqkGxkUfy1ar1gXOyy6Qu+CrxPUvUtlnWoLY/ZjrswRqJpz3rFdf4ZQa9WbXxTbr
        bObb1nc+qG67ElS60khvVWtSMgeHrfHNywu60h9lxuz7eb6bYZnFy1k3BWslb4n4HJC6aqTz
        mitd92RE98udHl6v9R3vL/lb38pmI6VpU2vzTY1V5L7j9mQZJZbijERDLeai4kQAParfoykD
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7oi3/bHGiyfrGdx/vwGdoueDVtZ
        LWac38dksWzTHyaLGZNfsjmwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlLJmxgLdjMUtFyfhZzA+NF5i5GTg4J
        AROJozvOM3UxcnEICSxllOg894qti5EDKCElMb9FCaJGWOLPtS42iJrXjBItr68xgtQIC8RI
        tM9kAakREXCX6D3zjh2iZiajxNU551hBEswCXhIdu3+wg9hsAoYSvUf7GEFsXgE7ibsXVjOB
        2CwCKhJ3/58CGyQqECHxfPsNqBpBiZMzn4DFOQXcJGbd/c4EMVNd4s+8S8wQtrhE05eVULvk
        Jba/ncM8gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAWNp2
        7OeWHYxd74IPMQpwMCrx8L7g3B8rxJpYVlyZe4hRgoNZSYT34oy9sUK8KYmVValF+fFFpTmp
        xYcYTYGem8gsJZqcD4zzvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwc
        nFINjD027w7Z+ZnNezBXu/zwM7MXO66ctwx5aCm3LL3jmNBcaedn3ilzNzqUcKswsr+x1Mzy
        fsDCcMKn0ClVd+pG0x12X8O1FX8F8W4TFJn/3LL5v7n22SjJqMh1sn7HmPr+H910n2FG1+7z
        14z/N3/nVxKLn7eo/c8CCZ+111fdP+94g23K+U1TfyixFGckGmoxFxUnAgAFz+4yuwIAAA==
X-CMS-MailID: 20191104095740eucas1p10cbb0cc5f6d857f06c0f4674c637ffbe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191104094357epcas1p171fa65258ca760f93ade2d07082a48be
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191104094357epcas1p171fa65258ca760f93ade2d07082a48be
References: <CGME20191104094357epcas1p171fa65258ca760f93ade2d07082a48be@epcas1p1.samsung.com>
        <1572860792-4471-1-git-send-email-sw0312.kim@samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/4/19 10:46, Seung-Woo Kim wrote:
> When driver is built as module and probe during insmod is deferred
> because of sensor subdevs, there is NULL pointer deference because
> mdev is cleaned up and then access it from v4l2_device_unregister().
> Fix the wrong mdev and v4l2 dev odder in error path of probe.

> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I think also 
Fixes: ("9832e155f1ed [media] media-device: split media initialization and registration")

could be added.
