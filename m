Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 583F37B661B
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 12:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239838AbjJCKNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 06:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239852AbjJCKNN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 06:13:13 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD5693
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 03:13:08 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5363227cc80so1110469a12.3
        for <linux-media@vger.kernel.org>; Tue, 03 Oct 2023 03:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696327987; x=1696932787; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OLi/tXW96Eo4JhUyo1FGt+BPp9bxMtGkdE5qNyeuvGM=;
        b=RmEWQc6I9+Q3hm2Gz+XxWYlGuGgMTbEHjpQn3zhResb7SMXgEcqQDcJj/iHqLBEo+S
         6RkWtn9aRWkjjY9xrNleoVtt6zAfpxTNXNayDztxeidtfERRhAKgsjpMZrJhGyf1WmIx
         jFP+wM7h5t2vHsmPqOw4kgjEvw13nNSX9PQY0+OpoHggx2619JmDDQu/kp2U5y4Ivkf+
         l4UiCz6md4ffmPM30Hk3taZ2gthoeAwi5af6bqc2LzK7BJJg5xxSfJkk6Q8xLc+ur/ip
         uwFNRP9dBN+hGbOxa0xhQbKr/eE96NKqwSYB/+7YKnF+zx+eu8HZ/aWtkoj52ib5smN8
         WXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696327987; x=1696932787;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLi/tXW96Eo4JhUyo1FGt+BPp9bxMtGkdE5qNyeuvGM=;
        b=pExKCLbkDhiaJYbp/qfDUR949M7vq/8Tq6qzPG6Rml+czkoD3opAef05OMrdUQHTKh
         3M9sGsrh2vxrT4vxrxgGfNFWwpFIJgicT28cYP0kdkGVg17zvBpXYdj9++BzALTVn+Ye
         6nWYUo7UK2zc2sV+6jyyeVuDhthZVZr3xYU+2z+eTmKxHsWo6QkI2bxcsOFNByB8iG/l
         /Vdnn3aW1LtyDLeoH84K62KtZor/00SUlBNhXJzePh9xnKQkPM++QlvUN/xge/wSDEYi
         fBOBDMpz71t7XDD7EO/pojUH8t1JMRam+N8eMBktmgBiK6OvHUYnwZvqYlPwCHeHMOAY
         PgrA==
X-Gm-Message-State: AOJu0YxUK2/0dusVIi+YXg/vpN44MAa0TVSs66vlRlFETmoeRdrEmCMT
        KYoCWDMwVxNH18q3QOE77MA=
X-Google-Smtp-Source: AGHT+IEKcrQjJ+op3+nrBUNde+aavjWhHFdSbX8LhkU4BfBnPite/8aUO8k11nmh6Zzd/UYB3t2RNQ==
X-Received: by 2002:a17:906:2cf:b0:9ad:e21a:8383 with SMTP id 15-20020a17090602cf00b009ade21a8383mr12343426ejk.53.1696327987015;
        Tue, 03 Oct 2023 03:13:07 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id z19-20020a17090655d300b009ad778a68c5sm803162ejp.60.2023.10.03.03.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:13:06 -0700 (PDT)
Message-ID: <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Date:   Tue, 03 Oct 2023 12:13:05 +0200
In-Reply-To: <20230727071558.1148653-11-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <20230727071558.1148653-11-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksCgpPbiBUaHUsIDIwMjMtMDctMjcgYXQgMTU6MTUgKzA4MDAsIGJpbmdidS5jYW9AaW50ZWwu
Y29tIHdyb3RlOgo+IEZyb206IEJpbmdidSBDYW8gPGJpbmdidS5jYW9AaW50ZWwuY29tPgo+IAo+
IElucHV0IHN5c3RlbSBkcml2ZXIgZG8gYmFzaWMgaXN5cyBoYXJkd2FyZSBzZXR1cCBhbmQgaXJx
IGhhbmRsaW5nCj4gYW5kIHdvcmsgd2l0aCBmd25vZGUgYW5kIHY0bDIgdG8gcmVnaXN0ZXIgdGhl
IElTWVMgdjRsMiBkZXZpY2VzLgoKPiArwqDCoMKgwqDCoMKgwqBtZWRpYV9kZXZpY2VfcGNpX2lu
aXQoJmlzeXMtPm1lZGlhX2RldiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGRldiwgSVBVNl9NRURJQV9ERVZfTU9ERUxfTkFNRSk7
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHN0cnNjcHkoaXN5cy0+djRsMl9kZXYubmFtZSwgaXN5cy0+
bWVkaWFfZGV2Lm1vZGVsLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzaXplb2Yo
aXN5cy0+djRsMl9kZXYubmFtZSkpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXQgPSBtZWRpYV9k
ZXZpY2VfcmVnaXN0ZXIoJmlzeXMtPm1lZGlhX2Rldik7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJl
dCA8IDApCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0X21lZGlhX2Rl
dmljZV91bnJlZ2lzdGVyOwouLi4KPiArb3V0X21lZGlhX2RldmljZV91bnJlZ2lzdGVyOgo+ICvC
oMKgwqDCoMKgwqDCoG1lZGlhX2RldmljZV91bnJlZ2lzdGVyKCZpc3lzLT5tZWRpYV9kZXYpOwo+
ICvCoMKgwqDCoMKgwqDCoG1lZGlhX2RldmljZV9jbGVhbnVwKCZpc3lzLT5tZWRpYV9kZXYpOwoK
WW91IHNob3VsZCBvbmx5IGNhbGwgbWVkaWFfZGV2aWNlX2NsZWFudXAoKSBpZiBtZWRpYV9kZXZp
Y2VfcmVnaXN0ZXIoKQpmYWlscy4KCgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2Vf
aWQgaXN5c19wY2lfdGJsW10gPSB7Cj4gK8KgwqDCoMKgwqDCoMKgeyBQQ0lfVkRFVklDRShJTlRF
TCwgSVBVNl9QQ0lfSUQpIH0sCj4gK8KgwqDCoMKgwqDCoMKgeyBQQ0lfVkRFVklDRShJTlRFTCwg
SVBVNlNFX1BDSV9JRCkgfSwKPiArwqDCoMKgwqDCoMKgwqB7IFBDSV9WREVWSUNFKElOVEVMLCBJ
UFU2RVBfQURMX1BfUENJX0lEKSB9LAo+ICvCoMKgwqDCoMKgwqDCoHsgUENJX1ZERVZJQ0UoSU5U
RUwsIElQVTZFUF9BRExfTl9QQ0lfSUQpIH0sCj4gK8KgwqDCoMKgwqDCoMKgeyBQQ0lfVkRFVklD
RShJTlRFTCwgSVBVNkVQX1JQTF9QX1BDSV9JRCkgfSwKPiArwqDCoMKgwqDCoMKgwqB7IFBDSV9W
REVWSUNFKElOVEVMLCBJUFU2RVBfTVRMX1BDSV9JRCkgfSwKPiArwqDCoMKgwqDCoMKgwqB7IH0K
PiArfTsKClVudXNlZAoKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlX2lk
IGlwdTZfaXN5c19pZF90YWJsZVtdID0gewo+ICvCoMKgwqDCoMKgwqDCoHsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgLm5hbWUgPSAiaW50ZWxfaXB1Ni5pc3lzIiwKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmRyaXZlcl9kYXRhID0KPiAoa2VybmVsX3Vsb25nX3Qp
JmlwdTZfaXN5c19hdXhkcnZfZGF0YSwKPiArwqDCoMKgwqDCoMKgwqB9LAo+ICt9OwoKTWlzc2lu
ZyBzZW50aW5lbCB7fS4KCgpCZXN0IHJlZ2FyZHMsCkFuZHJlYXMK

