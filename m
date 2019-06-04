Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D05347B5
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 15:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfFDNKP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 09:10:15 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43895 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727153AbfFDNKP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 09:10:15 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190604131013euoutp01e6fa727867c0c232ae50e077950cca67~lAOFcBTyS3124131241euoutp01M
        for <linux-media@vger.kernel.org>; Tue,  4 Jun 2019 13:10:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190604131013euoutp01e6fa727867c0c232ae50e077950cca67~lAOFcBTyS3124131241euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559653813;
        bh=iWdOqdf51+Xg8W2OHDmnfJgsaatSNdGBiGiIBaELpSQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=if0PUWFwEWPK2WICigBPhPTO0s9Ehoja23zxKJ60Q+/re4R/uRwH79AuPcFllp1hQ
         pCgiEiWM2U2RScvJiJ+IZNyUtkAC7yprntvi2yOX6JjevMdti+xe0ALNoSWzlarkKg
         Exx6a7193daLIDzHPGSvGo3w9tf3Xm+DbxQOnFds=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190604131012eucas1p1a58b2c71e47029236cb8d5ea2bd7ec48~lAOEUoEDE0311203112eucas1p1w;
        Tue,  4 Jun 2019 13:10:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 40.FA.04298.4BD66FC5; Tue,  4
        Jun 2019 14:10:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190604131011eucas1p1dec86d30e87e0b6c46eed8bde559bd7d~lAODmUAbi0311303113eucas1p13;
        Tue,  4 Jun 2019 13:10:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190604131011eusmtrp122a1902d207cabae9ec05fd02e275fd9~lAODWwb2W0320503205eusmtrp1R;
        Tue,  4 Jun 2019 13:10:11 +0000 (GMT)
X-AuditID: cbfec7f2-3615e9c0000010ca-e5-5cf66db46db5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C2.18.04146.3BD66FC5; Tue,  4
        Jun 2019 14:10:11 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190604131011eusmtip2716cfebfaa8ed4537b2aef9e8ae1eb90~lAOC7hVgt3044330443eusmtip2h;
        Tue,  4 Jun 2019 13:10:11 +0000 (GMT)
Subject: Re: [PATCH v6 1/2] media: v4l2: Make sure all drivers set _MPLANE
 caps in vdev->device_caps
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <c2b11229-c66c-4a77-4775-eff416243da1@samsung.com>
Date:   Tue, 4 Jun 2019 15:10:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604070625.7664-1-boris.brezillon@collabora.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SeyyVcRj2O9/3HZ+TY59DO29u5UyJza219oWJ1tZZf1lbJdny4XNZDjrH
        JfKH1TKXk4Qmh5ZiwlY45FraqE4uXaRQkstsTO4OS0TO+VT+e97nfd49z7O9JCbSEBZkRFQs
        K49iIiV8AV7/evW9U51sJcB1UCWmu7o7eXTpajOPni8OpmvfKQk6/XapIa2sfkrQZep1Hr3Y
        2YTR3S8q+PTSjQ2+t0BamNKDS/PWaghp41ApkhamFRDS9uUHuFRdmc6X1k5mYtIltY0v6S/w
        DGEjI+JZuYtXoCB8eHoRi2nErgzkz6EUtMDLQEYkUIeho3UD12ERVY5gYiomAwm2sBbBdNE8
        xg1LCHJLav9d9Pf/5nMXjxD0pbKcaAbB5ssfepEZFQrZjS16kTkVAEXLLYROhFG1PCh/rsF0
        Cz7lBjdfZSEdFlJeMPtlgtBhnLKD3s8V+ky7KT/QNqm3NabQUTCu542o47A+XqM3wCgxXNNW
        EBzeCw0zRRiXdMwQVJ0Mh09Ae17KdgMzmNLUGXLYCrpylbguHFDXEShbBg25IRvBsKYYcSoP
        aNf0bDmQWw4OUNXswtE+0Dt2F+looExgYMaUy2ACOfX5GEcLIS1VxKntYK0yfzuCBWSOb+LZ
        SKLa0Uy1o41qRxvVf99ihFciMRunkIWxCrcoNsFZwcgUcVFhzsHRMjXaeq+uDc1iI1r+GNSG
        KBJJjIXzzEqAiGDiFYmyNgQkJjEXMoPaAJEwhElMYuXRF+VxkayiDVmSuEQsvGowckFEhTGx
        7CWWjWHlf7c80sgiBZ2pDnLJrbxjzWZZTsx+GL0fmnDW9mT0KceSrqHEY+eqD5r/tCqJzXE/
        RHrfm/AcnSOSntjtsULf39p4RB5JOv3toa0o2T/Qx93VumFKW9aXdcA+WWzfurBfyfoNHK1y
        4I3c+mVg9/X8wrhVR9gu08v21av7vCf7fcWfnllOOhk/fhMkwRXhjJsjJlcwfwDviYoZWgMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xe7qbc7/FGLyeoWpx+swpJoslP3cx
        WXxYkGyx+VwPq0XnxCXsFj0btrJaLNv0h8ni06mdzBZn9q9ks/jc+o/NgctjdsNFFo8pvzey
        euy4u4TRY3bHTFaPw18XsnhsWtXJ5rH5RTezx+dNcgEcUXo2RfmlJakKGfnFJbZK0YYWRnqG
        lhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZ9998Yi7YwVxxY/p7xgbGj0xdjJwcEgIm
        Etev/2XrYuTiEBJYyihxsuEbexcjB1BCSmJ+ixJEjbDEn2tdUDWvGSVWtn9nBUkIC6RJTNix
        mw3EFhGIkVhy/iYzSBGzwGYmifmr57FDdExllDi+/xc7SBWbgKFE79E+RhCbV8BO4t3N52CT
        WARUJC5fXckCYosKREjM3tXAAlEjKHFy5hMwm1PASeLPk41g25gF1CX+zLvEDGGLSzR9WckK
        YctLbH87h3kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIER
        u+3Yz807GC9tDD7EKMDBqMTDOyP+W4wQa2JZcWXuIUYJDmYlEd7E219ihHhTEiurUovy44tK
        c1KLDzGaAj03kVlKNDkfmEzySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0
        MXFwSjUw2k/5UCcq9r91i+/2witVy1+tijtoe3vdZ70UjWdbZFi9rBqWcB18+/aDTWXCJZVd
        nHNEfQtvnPnf3DLBhGVv/xWBrmbm613L5ufH9st+PGBzxHTT98SQwyeWx74/+KaYe3Px28R4
        95zDZmdtFvl+643oblKZL3LFsrQoWuzGhxdvziWtunmYV4mlOCPRUIu5qDgRAKiH6VXuAgAA
X-CMS-MailID: 20190604131011eucas1p1dec86d30e87e0b6c46eed8bde559bd7d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190604070638epcas2p32a4f7ec8c40822a1559bdcc2a918a502
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190604070638epcas2p32a4f7ec8c40822a1559bdcc2a918a502
References: <CGME20190604070638epcas2p32a4f7ec8c40822a1559bdcc2a918a502@epcas2p3.samsung.com>
        <20190604070625.7664-1-boris.brezillon@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/4/19 09:06, Boris Brezillon wrote:
> This is needed if we want the core to be able to check _MPLANE support
> without having to call the ->vdioc_querycap() hook.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

For:
 drivers/media/platform/exynos-gsc
 drivers/media/platform/exynos4-is
 drivers/media/platform/s5p-mfc

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Thanks,
Sylwester
