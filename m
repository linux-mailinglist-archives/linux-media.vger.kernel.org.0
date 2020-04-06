Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5588419F713
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 15:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbgDFNhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 09:37:13 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:39352 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728488AbgDFNhN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 09:37:13 -0400
Received: by mail-lf1-f49.google.com with SMTP id m2so558857lfo.6
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=YMZJsRA9WTZuauj3S6i3D/K7Wemk5+JrRSgXFuKrVSc=;
        b=b4YOxi6eH1CBxpyt3gQE/SzCbh5u3A9zx38/zt2GQHOgma5gpBUjK83MWfsPYothOQ
         bUmALso3oRh20pKbRtVZbmk+HCqW7I0Dymsb4h7V4LmPUFV9qvj2UNoigISceS5k+o+o
         bxT9upWX43p+z/ejjMT+ULKVrqjdkIt8+DbvhCNhtETUjBv/1+No81kbkBcAMiW3pUu9
         PtYPq//QaLh6p+RQOIO/1pWFYOMxqBEV2UOcT98tPArxMKX/aIpc7rOUtWVm6Hyz74DY
         V1RL/iD+GegyRkhjdsO69ziVWoZBRoJXBN1Qh5Bvomsj9MlDEdxj4AL0EoCJKfTo4VOb
         PDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=YMZJsRA9WTZuauj3S6i3D/K7Wemk5+JrRSgXFuKrVSc=;
        b=p3kk3dQkAfvwhxLUO1vzEZjjISg/MeUVv15fxsb075hManQb+QRMGvBkCZ+3TSiIi8
         wy6P7flPYDpzdrZhrf5wRKqqO9GbytJaoJBEQAAPZZDwxldjL2PDLKmaUZcSaYIPqYC2
         g5fcJIELRT5teUjzV5UyKItXlbW4awBUePKx53AVbk23ICHXDlZnI1r3B508n7Dnnz82
         ewhKd16cy/FsHAbcfqNn6Ogr8TjU0d1Jtywgy8DcCToCbZm2+o/GuQMku0DTvf7VwVDk
         ZewSNsG30q0aIs9BC1egQvvNLfJM0Y7BU7JX7JirNFihE+4BogC+8/e6QnMmwiG1jTlx
         egcg==
X-Gm-Message-State: AGi0PuYwmlDuZr3YXYrhq4USCwyziuEA9brfcsBN9bp8vKyayz3KreF2
        ykOk6lFl7YLJs0/tKixkdWIwcc7x0amscFC5GmJuQCBUpi8=
X-Google-Smtp-Source: APiQypIfctQ/bRl5Ytf6hzCailv/55VnGY47WvnlWzfJqHJAY5fGyYZN8rXTZ++RRLhcrq0k8s+ASlKa8G+lYYUEUrM=
X-Received: by 2002:a05:6512:3b7:: with SMTP id v23mr12959794lfp.66.1586180231696;
 Mon, 06 Apr 2020 06:37:11 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 6 Apr 2020 10:37:34 -0300
Message-ID: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
Subject: imx6: Cannot register mem2mem
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am running kernel 5.6.2 on an imx6qp sabresd, but I cannot get the
mem2mem element from imx-media-csc-scaler.c to probe.

I don't see imx6_media_probe_complete() getting called, hence
imx_media_csc_scaler_device_init() is never called and no mem2mem
element is registered.

Any ideas as to how to get mem2mem registered on i.MX6?

Thanks,

Fabio Estevam
