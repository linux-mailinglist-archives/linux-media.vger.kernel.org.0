Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6C24169C1
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 04:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243810AbhIXCEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 22:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243767AbhIXCEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 22:04:02 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C739C061574
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 19:02:30 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id x7so15595324edd.6
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 19:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dgpwPCQznEmVXGZRT9a+ot3RVGNTTHbl31G3nps7wKQ=;
        b=mgPpbP9aF381f5/bN4qtkHP939PGhcj90yUZsl1VfUXihpaTI2OEitivScQAZI84IR
         8I6An1StEtMYrFFZZj9hGvt0mijwOLvGBxCDk8CVgSbvq9Z7C5S/Z7OTWFDs5th9bJgS
         aHy55nmFGrq22bmL6i3zH36/BtRtA07Fs4T+88nM6graF2FGed7Q8AXzSFUF5U9Fh7sE
         qJTzzVch65WkR0jNkKiYaosEWl/LDRqcsVE/SMtX+wQIqEh68E51O1btylXJyaVmuCv6
         YNqiyKysp6Xb+H0aHJ+jJ4cgRd7HkEfgXBTkvjKlMTxjZTJNWrxKTHRKCTa/pTHantWi
         lr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=dgpwPCQznEmVXGZRT9a+ot3RVGNTTHbl31G3nps7wKQ=;
        b=vFOoQhTKzcyzu9JBNk3Wdt8tUa/COzqHf26KQH3s29ESXH8WxeNsy89t8etfu0pdAm
         92l43BSA5pzJj6+PrZUydzEhp2Q4r0mM+a0INY+DtnTZW63gyXF0iArH34rFnSnCqrHr
         IXt6SP8Kn4XDkQ/4JVubJZ+64k/fA3CDfMdM1KWFWAd66DvJXtbOmx1v2pnriqZMFlNM
         CU95BJfkyu1bqmV2Kk8Y90ZHns8hMNdDQweTeKG5s0IOvIj3lKhTQNtBAusXPo/ancYI
         GJZFXz1QfQ+c1EU88tJSuSubKCAFPeYnP9T1mvFWoNrUk7ftFpxg/h0YnqUGqzXYgW3G
         V5sQ==
X-Gm-Message-State: AOAM531JlzKX+X/JTCE9tWk3r5hl8DdCUAhnMZFRmM7/pyUNgfZYNDcF
        /NhS/K5U3VoCBbzfNt9fwyLRxDB4My5Y5pUPz8w=
X-Google-Smtp-Source: ABdhPJxET9d3co3mX5K9wVkBpKztPPpaWkhRImGEH2n1V49NpPJAnXVUybIPSdyEcXM5G4RflQP1FBiUQeCXdfTyg4w=
X-Received: by 2002:a17:906:9aca:: with SMTP id ah10mr8403321ejc.471.1632448948390;
 Thu, 23 Sep 2021 19:02:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:5615:0:0:0:0 with HTTP; Thu, 23 Sep 2021 19:02:24
 -0700 (PDT)
Reply-To: michaelrachid7@gmail.com
From:   Michael Rachid <sammyhamidou93@gmail.com>
Date:   Fri, 24 Sep 2021 03:02:24 +0100
Message-ID: <CAOO_Zf_CW=RAO3urxYOASd-XNaLvWwba=jA4LuJyUAtNom+AFw@mail.gmail.com>
Subject: =?UTF-8?B?7KCc7JWIIGplYW4vUHJvcG9zYWw=?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

7Lmc6rWs7JeQ6rKMLA0KDQrrgpjripQg64u57Iug6rO8IO2VqOq7mCDsspjrpqztlZjqs6Ag7Iu2
7J2AIOyCrOyXhSDsoJzslYjsl5Ag64yA7ZW0IOyVjOumrOq4sCDsnITtlbQg6riA7J2EIOyUgeuL
iOuLpC4NCjXsspzrp4wg64us65+s6rCAIO2IrOyeheuQqeuLiOuLpC4g66qo65OgIOqyg+ydtCDt
lanrspXsoIHsnbTqs6Ag7JyE7ZeY7ZWY7KeAIOyViuycvOuLiCDslYjsi6ztlZjsi63si5zsmKQu
DQrqtIDsi6zsnYQg7ZGc7Iuc7ZW0IOyjvOyLreyLnOyYpC4NCg0K66eI7J207YG0IOudvOyLnOuT
nC4NCg0KY2hpbmd1ZWdlLA0KDQpuYW5ldW4gZGFuZ3Npbmd3YSBoYW1ra2UgY2hlb2xpaGFnbyBz
aXAtZXVuIHNhLWVvYiBqZWFuLWUgZGFlaGFlDQphbGxpZ2kgd2loYWUgZ2V1bC1ldWwgc3NldWJu
aWRhLg0KNWNoZW9ubWFuIGRhbGxlb2dhIHR1LWliZG9lYm5pZGEuIG1vZGV1biBnZW9zLWkgaGFi
YmVvYmplb2ctaWdvDQp3aWhlb21oYWppIGFuaC1ldW5pIGFuc2ltaGFzaWJzaW8uDQpnd2Fuc2lt
LWV1bCBweW9zaWhhZSBqdXNpYnNpby4NCg0KbWFpa2V1bCBsYXNpZGV1Lg0KDQoNCkRlYXIgZnJp
ZW5kLA0KDQpJIHdyaXRlIHRvIGluZm9ybSB5b3UgYWJvdXQgYSBidXNpbmVzcyBwcm9wb3NhbCBJ
IGhhdmUgd2hpY2ggSSB3b3VsZA0KbGlrZSB0byBoYW5kbGUgd2l0aCB5b3UuDQpGaWZ0eSBtaWxs
aW9uIGRvbGxhcnMgaXMgaW52b2x2ZWQuIEJlIHJlc3QgYXNzdXJlZCB0aGF0IGV2ZXJ5dGhpbmcg
aXMNCmxlZ2FsIGFuZCByaXNrIGZyZWUuDQpLaW5kbHkgaW5kaWNhdGUgeW91ciBpbnRlcmVzdC4N
Cg0KTWljaGFlbCBSYWNoaWQuDQo=
