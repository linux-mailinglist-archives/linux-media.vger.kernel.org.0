Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A477AE68D
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 09:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbjIZHQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 03:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjIZHQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 03:16:18 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5065DE
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 00:16:08 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id EFB1824002A
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 09:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1695712567; bh=Hnun/WSgTHclDT7t/mYAYrb5K/GMwwYPZcQjP0dYjw0=;
        h=Message-ID:Subject:From:To:Cc:Date:Content-Transfer-Encoding:
         MIME-Version:From;
        b=JqoP1dKfQgDYJ7IeHVLEJbQl2yHTo39jQ2iFudP3/OSg0vf32BiHjI0kk2QJqQaQ0
         /K+dD3VgYC7mnrj/y/+Qsa6p43KfYIFfWEK2z3YRHbRAuKJ1VbKMpupUSVkaol3DX5
         TEbAV1UtosbZhv+Xfe+7Jh/eibxMuDsbiLPp8EmQc6gMkowP3tks3as4Omkryz9N5a
         o3GJFX2zBRf/YpNJbwTqNUG0SsFWynTUbNf0AWhabe2Zt8QPQB0sQOiBX1DJTbZ3ZS
         WgU4CwWcqb9B6nJ/1a6Miqg50rgg1YQQV+jXmVmTyeQjsDd/9QD8He6G5RfKGK6KJV
         VuU/kaUo4yWkg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Rvrd20WYtz6tmv;
        Tue, 26 Sep 2023 09:16:06 +0200 (CEST)
Message-ID: <d387939e94b753478df8caa62513aacc6d7c7b1c.camel@posteo.de>
Subject: Re: [PATCH] media: i2c: Use pm_runtime_resume_and_get()
From:   Martin Kepplinger <martink@posteo.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Daniel Scally <djrscally@gmail.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>
Date:   Tue, 26 Sep 2023 07:16:05 +0000
In-Reply-To: <20230914172054.31825-1-laurent.pinchart@ideasonboard.com>
References: <20230914172054.31825-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QW0gRG9ubmVyc3RhZywgZGVtIDE0LjA5LjIwMjMgdW0gMjA6MjAgKzAzMDAgc2NocmllYiBMYXVy
ZW50IFBpbmNoYXJ0Ogo+IFNpbXBsaWZ5IGVycm9yIGhhbmRsaW5nIGJ5IHVzaW5nIHBtX3J1bnRp
bWVfcmVzdW1lX2FuZF9nZXQoKSBpbnN0ZWFkCj4gb2YKPiBwbV9ydW50aW1lX2dldF9zeW5jKCkg
d2l0aCBhIHB1dCBjYWxsIGluIHRoZSBlcnJvciBwYXRoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0K
PiDCoGRyaXZlcnMvbWVkaWEvaTJjL2Njcy9jY3MtY29yZS5jIHzCoCA2ICsrKy0tLQo+IMKgZHJp
dmVycy9tZWRpYS9pMmMvaGk4NDYuY8KgwqDCoMKgwqDCoMKgIHzCoCA2ICsrLS0tLQo+IMKgZHJp
dmVycy9tZWRpYS9pMmMvaGk4NDcuY8KgwqDCoMKgwqDCoMKgIHzCoCA1ICsrLS0tCj4gwqBkcml2
ZXJzL21lZGlhL2kyYy9pbXgyMDguY8KgwqDCoMKgwqDCoCB8IDE0ICsrKysrKystLS0tLS0tCj4g
wqBkcml2ZXJzL21lZGlhL2kyYy9vZzAxYTFiLmPCoMKgwqDCoMKgIHzCoCA1ICsrLS0tCj4gwqBk
cml2ZXJzL21lZGlhL2kyYy9vdjU2OTMuY8KgwqDCoMKgwqDCoCB8wqAgNiArKystLS0KPiDCoGRy
aXZlcnMvbWVkaWEvaTJjL292NzI1MS5jwqDCoMKgwqDCoMKgIHzCoCA4ICsrKysrLS0tCj4gwqBk
cml2ZXJzL21lZGlhL2kyYy9zdC12Z3h5NjEuY8KgwqDCoCB8wqAgOSArKy0tLS0tLS0KPiDCoDgg
ZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL2Njcy9jY3MtY29yZS5jCj4gYi9kcml2ZXJzL21l
ZGlhL2kyYy9jY3MvY2NzLWNvcmUuYwo+IGluZGV4IDQ5ZTBkOWEwOTUzMC4uNTY5YmY5YjY3NTM5
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2Njcy9jY3MtY29yZS5jCj4gKysrIGIv
ZHJpdmVycy9tZWRpYS9pMmMvY2NzL2Njcy1jb3JlLmMKPiBAQCAtMTg5Myw5ICsxODkzLDkgQEAg
c3RhdGljIGludCBjY3NfcG1fZ2V0X2luaXQoc3RydWN0IGNjc19zZW5zb3IKPiAqc2Vuc29yKQo+
IMKgwqDCoMKgwqDCoMKgwqAgKiByZWxpZXMgYXQgdGhlIHJldHVybmVkIHZhbHVlIHRvIGRldGVj
dCBpZiB0aGUgZGV2aWNlIHdhcwo+IGFscmVhZHkKPiDCoMKgwqDCoMKgwqDCoMKgICogYWN0aXZl
IG9yIG5vdC4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDCoMKgcnZhbCA9IHBt
X3J1bnRpbWVfZ2V0X3N5bmMoJmNsaWVudC0+ZGV2KTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAocnZh
bCA8IDApCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyb3I7Cj4gK8Kg
wqDCoMKgwqDCoMKgcnZhbCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoJmNsaWVudC0+ZGV2
KTsKPiArwqDCoMKgwqDCoMKgwqBpZiAocnZhbCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIHJ2YWw7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgLyogRGV2aWNlIHdhcyBh
bHJlYWR5IGFjdGl2ZSwgc28gZG9uJ3Qgc2V0IGNvbnRyb2xzICovCj4gwqDCoMKgwqDCoMKgwqDC
oGlmIChydmFsID09IDEpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL2hpODQ2LmMg
Yi9kcml2ZXJzL21lZGlhL2kyYy9oaTg0Ni5jCj4gaW5kZXggZmEwMDM4NzQ5YTNiLi44YThhZTg5
YTg0NTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvaGk4NDYuYwo+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvaTJjL2hpODQ2LmMKPiBAQCAtMTYxMywxMSArMTYxMyw5IEBAIHN0YXRpYyBp
bnQgaGk4NDZfc2V0X3N0cmVhbShzdHJ1Y3QgdjRsMl9zdWJkZXYKPiAqc2QsIGludCBlbmFibGUp
Cj4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJmhpODQ2LT5tdXRleCk7Cj4gwqAKPiDCoMKg
wqDCoMKgwqDCoMKgaWYgKGVuYWJsZSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKCZjbGllbnQtPmRldik7Cj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQgPCAwKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwbV9ydW50aW1lX3B1dF9ub2lkbGUoJmNsaWVudC0+
ZGV2KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gcG1fcnVudGltZV9y
ZXN1bWVfYW5kX2dldCgmY2xpZW50LT5kZXYpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAocmV0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGdvdG8gb3V0Owo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IGhpODQ2X3N0YXJ0X3N0cmVh
bWluZyhoaTg0Nik7Cj4gCgpmb3IgdGhlIGhpODQ2IGRyaXZlcjoKClRlc3RlZC1ieTogTWFydGlu
IEtlcHBsaW5nZXIgPG1hcnRpbmtAcG9zdGVvLmRlPiAKCnRoYW5rcyBmb3IgdGhlIHBhdGNoIQoK


