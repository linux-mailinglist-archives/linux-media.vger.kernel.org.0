Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD12554DDA7
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 10:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376642AbiFPIzR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 04:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376702AbiFPIys (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 04:54:48 -0400
X-Greylist: delayed 77671 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 16 Jun 2022 01:52:59 PDT
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A6E32981C;
        Thu, 16 Jun 2022 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=WfH/J
        MKk2IaZWzy9foOuyFcibG8HjD8vi566659/mVY=; b=iVe45USAfP6Jc5fsm2JWH
        xmNl7bIEEXXsh5egnYThYJgwsy98oHrYFG+of0nfRabJNlUrseoIBYy5zQQj61uW
        7doU/3RT+yDVWVJO2QeJr6/C9FV6Q9mVXqezLiCNFi9Jlgtf5OXbR4CmRLCsrX6U
        DIHjX5ROa/R/4rrn87ls7U=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Thu, 16 Jun 2022 16:52:20 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Thu, 16 Jun 2022 16:52:20 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Greg KH" <gregkh@linuxfoundation.org>,
        "Conor.Dooley" <conor.dooley@microchip.com>
Cc:     "Daniel Vetter" <daniel@ffwll.ch>,
        "Dave Airlie" <airlied@gmail.com>, linux-tegra@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-serial@vger.kernel.org,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>
Subject: Re:Re: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add
 missing of_node_put() in serial-tegra.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <YqrtP2jS0Gg4pBRe@kroah.com>
References: <20220615104833.3963552-1-windhl@126.com>
 <Yqm6LvDGqaRMaUHa@kroah.com>
 <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
 <CAKMK7uG+TeATXctJaXBgSRxpinDdtOhGa+o2CMPaPtO1QyHtJA@mail.gmail.com>
 <YqrtP2jS0Gg4pBRe@kroah.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <5911192c.6793.1816bb6a391.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowADX3ydF76pixj43AA--.11206W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QkiF1pEANa5mAACs6
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CkF0IDIwMjItMDYtMTYgMTY6NDM6NDMsICJHcmVnIEtIIiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+IHdyb3RlOgo+T24gV2VkLCBKdW4gMTUsIDIwMjIgYXQgMTA6MzA6NDdQTSArMDIwMCwg
RGFuaWVsIFZldHRlciB3cm90ZToKPj4gT24gV2VkLCAxNSBKdW4gMjAyMiBhdCAyMjoyMywgRGF2
ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPj4gPgo+PiA+IE9uIFdlZCwgMTUg
SnVuIDIwMjIgYXQgMjA6NTMsIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3
cm90ZToKPj4gPiA+Cj4+ID4gPiBPbiBXZWQsIEp1biAxNSwgMjAyMiBhdCAwNjo0ODozM1BNICsw
ODAwLCBoZWxpYW5nIHdyb3RlOgo+PiA+ID4gPiBJbiB0ZWdyYV91YXJ0X2luaXQoKSwgb2ZfZmlu
ZF9tYXRjaGluZ19ub2RlKCkgd2lsbCByZXR1cm4gYSBub2RlCj4+ID4gPiA+IHBvaW50ZXIgd2l0
aCByZWZjb3VudCBpbmNyZW1lbnRlZC4gV2Ugc2hvdWxkIHVzZSBvZl9ub2RlX3B1dCgpCj4+ID4g
PiA+IHdoZW4gaXQgaXMgbm90IHVzZWQgYW55bW9yZS4KPj4gPiA+ID4KPj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogaGVsaWFuZyA8d2luZGhsQDEyNi5jb20+Cj4+ID4gPgo+PiA+ID4gV2UgbmVlZCBh
IHJlYWwgbmFtZSBwbGVhc2UsIG9uZSB5b3Ugc2lnbiBkb2N1bWVudHMgd2l0aC4KPj4gPgo+PiA+
IEhvdyBkbyB3ZSBlbmZvcmNlIHRoYXQ/IFdoYXQgaWYgV29uZywgQWRlbGUgb3IgQmV5b25jZSBz
dWJtaXQgYSBwYXRjaD8KPj4gPgo+PiA+IFdoYXQgaGFwcGVucyBpZiB0aGF0IHBhdGNoIGdldHMg
cmVwb3N0ZWQsIHdpdGggUy1vLWI6IEhlIExpYW5nCj4+ID4gPHdpbmRobEAxMjYuY29tPiBvciBI
ZWwgSWFuZywgSGVsaSBBbmc/IERvIHlvdSBrbm93IGFueSBvZiB0aG9zZSBhcmUKPj4gPiByZWFs
IG5hbWVzPyBXaGF0IGhhcHBlbnMgaWYgdGhleSBwb3N0IGEgcmVhbCBuYW1lIGluCj4+ID4gTWFu
ZGFyaW4vVGhhaS9DeXJpbGxpYywgY2FuIHlvdSB2YWxpZGF0ZSBpdD8KPj4gPgo+PiA+IFJlYWxs
eSB3ZSByZXF1aXJlIHlvdSBoYXZlIGFuIGlkZW50aXR5IGF0dGFjaGVkIHRvIGFuIGVtYWlsLiBJ
ZiB0aGVyZQo+PiA+IGlzIGEgcHJvYmxlbSBpbiB0aGUgZnV0dXJlLCB3ZSdkIHByZWZlciB0aGUg
ZW1haWwgY29udGludWVzIHRvIHdvcmsgc28KPj4gPiB0aGF0IHlvdSBhcmUgY29udGFjdGFibGUu
IElmIHlvdSBhcmUgc3VibWl0dGluZyBhIHNtYWxsIGFtb3VudCBvZgo+PiA+IGNoYW5nZXMgaXQn
cyBwcm9iYWJseSBuZXZlciBnb2luZyB0byBtYXR0ZXIuIElmIHlvdSBhcmUgc3VibWl0dGluZwo+
PiA+IGxhcmdlciBib2RpZXMgb2Ygd29yayBvZiBjb3Vyc2UgaXQgd291bGQgYmUgZ29vZCB0byBo
YXZlIGEgY29tcGFueSBvcgo+PiA+IGxhcmdlciBvcmcgYXR0YWNoZWQgdG8gdHJhY2sgdGhpbmdz
IGRvd24gbGVnYWxseSBsYXRlciwgYnV0IGFnYWluIHRoYXQKPj4gPiBpc24ndCBhbHdheXMgcG9z
c2libGUuCj4+ID4KPj4gPiBJIGRvbid0IHRoaW5rIGFsaWVuYXRpbmcgdGhlIG51bWVyb3VzIGRl
dmVsb3BlcnMgd2hvIG5vIGxvbmdlciB1c2UKPj4gPiB0aGVpciBsZWdhbCBuYW1lcyBhcmUgaWRl
bnRpZmllZCBieSBvbmUgbmFtZSwgYnV0IGhhdmVuJ3QgY2hhbmdlZAo+PiA+IHRoZWlyIGxlZ2Fs
IG9uZSB5ZXQgcGVvcGxlIHdobyBnZXQgbWFycmllZCBhbmQgY2hhbmdlIHRoZWlyIGxlZ2FsIG5h
bWUKPj4gPiBidXQgZG9uJ3QgY2hhbmdlIHRoZWlyIGNvbnRyaWJ1dGlvbiBuYW1lIGFuZCBJIGNv
dWxkIHJ1biB0aGlzIHNlbnRlbmNlCj4+ID4gb24gZm9yZXZlci4KPj4gCj4+IFllYWggbGlrZSBh
YnNvbHV0ZSBiZXN0IGNhc2UgdHJ5aW5nIHRvICJlbmZvcmNlIiB0aGlzIGp1c3QgcmVzdWx0cyBp
bgo+PiBlbmNvdXJhZ2luZyBwZW9wbGUgdG8gY29tZSB1cCB3aXRoIGVudGlyZWx5IGZha2UgYnV0
IEVuZ2xpc2ggbG9va2luZwo+PiBuYW1lcyBmb3IgdGhlbXNlbHZlcy4gV2hpY2ggLi4uIGp1c3Qg
bm8uCj4KPkFncmVlLCBhZ2FpbiwgSSdkIHByZWZlciB0byB0YWtlIHJlYWwgbmFtZXMgaW4gbmF0
aXZlIGxhbmd1YWdlcywgb3VyCj50b29scyBjYW4gaGFuZGxlIHRoYXQganVzdCBmaW5lLiAgTm8g
bmVlZCB0byBtYWtlIHVwIGFueXRoaW5nLgo+Cj50aGFua3MsCj4KPmdyZWcgay1oCgpoaSwgR3Jl
ZyBLLUgsIAoKSSBoYXZlIHJlc2VudCBhIG5ldyBwYXRjaCBmb3IgbXkgY29tbWl0IG9mIHRlZ3Jh
X3VhcnRfaW5pdCgpIGJ1ZyB3aXRoIG15IHJlYWwgbmFtZSBmb3IgU29iLgoKU28gdGhlcmUgaXMg
YW55b3RoZXIgdGhpbmcgSSBzaG91bGQgZG8/
