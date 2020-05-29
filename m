Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712ED1E7AD4
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 12:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgE2KmE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 06:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgE2KmD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 06:42:03 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB035C03E969
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 03:42:02 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id n5so2904832wmd.0
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JVchq/HIShciP4iV6rg21FSFr1D3DbG0V3fBta4W2tI=;
        b=LkZpuvvHDUG1asJI56josmIbCq9oEeoxKfgy+ACSWjhZ4aeJ6E8VOaHJ0CLVb6Rf0d
         o9uM4AjLc7Vm2mOI4GafU9z0M879X4uiedtnuD5NobDg4YBxeTRSfp9vHrQ3Xn3xvJeI
         Fy10ut7GgBAWLg8a/zESQW7yz/Ynla9fFJBDL0NACVuOfgw4Ty9MiA2QCtftSnHOdeQO
         ue4+0UqEN7txKBTPB1cVD33NwT7arDXWdTKv8n84krWEmCKvx57AhQ8Bf8PACiIFiz4I
         lQKXXTSQoue4tu8PgHA7Q7Owi6szxvFJKUy6JDOhXb/IFsoxEctPDqwoTs+s5e8M9hZl
         ymgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JVchq/HIShciP4iV6rg21FSFr1D3DbG0V3fBta4W2tI=;
        b=LplcCv7XtikGEGqTpcuOZPRInEm1EPrOCIhxPrzZBOrwzzWGqWhxfpctjSPO+ijxRu
         1kXK6CDhcYJUHJLStSaNqdaGoJ5k05mgAGn/+O3Ya0Y4wXglZVUK7JBjUi+xQwk64ilh
         33gjEGEENue5PwelTdOcH68AVjo50lqdRfzz4uM8841ik3LWlq9y5o/a610NReaZC6AH
         VHHWeeFkbDE8g3xhI/MGIEl+7NXm94PeRiM5tAr5PLpZ+RTY/ZxVFrU58S63HwwVC0Rn
         QHy5O4Qvp+hKy+qS/4P43WQ+krJDwIt+uQCt7DK3W78RYxtaTbVuYSkWu/pRxpT0mSZB
         nLyw==
X-Gm-Message-State: AOAM532tnxSNOgsEfgL5OA7eI/3xP9rkoj6BN/xaUWB8ycT5b3JqbrCK
        8LYFL0kWqj1RiCpMoaKs3+7KL6r2
X-Google-Smtp-Source: ABdhPJxHva7eAtfiMLqsKSugAvU6DS9t0yE+KnJU1lrFnWSn46t1zfhSwhCtjVLYdo7xSKSmzR/vEw==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr7417775wmj.143.1590748921410;
        Fri, 29 May 2020 03:42:01 -0700 (PDT)
Received: from johan-pc.localnet ([2a02:810d:ec0:a194:c162:e214:ad93:6fe8])
        by smtp.gmail.com with ESMTPSA id u10sm9410300wmc.31.2020.05.29.03.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 03:42:01 -0700 (PDT)
From:   Johan Claude-Breuninger <johan.claudebreuninger@gmail.com>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: em28xx driver issue kernel 5.7.0
Date:   Fri, 29 May 2020 12:42:00 +0200
Message-ID: <2170285.lfiVHom0a2@johan-pc>
In-Reply-To: <20200529103453.GA27598@gofer.mess.org>
References: <3329904.flSn8SIOqe@johan-pc> <20200529103453.GA27598@gofer.mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SSBhbSB1c2luZyBmb2xsb3dpbmcga2VybmVsIHZlcnNpb246CgpMaW51eCBKb2hhbi1QQyA1Ljcu
MC1yYzctMS1tYWlubGluZSAjMSBTTVAgUFJFRU1QVCBNb24sIDI1IE1heSAyMDIwIDE3OjI5OjM3
ICswMDAwIHg4Nl82NCBHTlUvTGludXgKCmZyb20gQXJjaCBMaW51eCcgQVVSLgoKCldpbGwgeW91
ciBtZW50aW9uZWQgcGF0Y2ggYmUgaW5jbHVkZWQgaW4gdGhlIGZpbmFsIDUuNy4wIHJlbGVhc2U/
CgoKVGhhbmtzCgpKb2hhbgoKCkxlIHZlbmRyZWRpIDI5IG1haSAyMDIwLCAxMjozNDo1MyBDRVNU
IFNlYW4gWW91bmcgYSDpY3JpdCA6Cj4gT24gRnJpLCBNYXkgMjksIDIwMjAgYXQgMTA6MzI6MzhB
TSArMDIwMCwgSm9oYW4gQ2xhdWRlLUJyZXVuaW5nZXIgd3JvdGU6Cj4gPiBHb29kIG1vcm5pbmcs
Cj4gPiAKPiA+IAo+ID4gSSBob3BlIHRoYXQgdGhpcyBpcyB0aGUgcmlnaHQgcGxhY2UgdG8gcmVw
b3J0IGEgYnVnIGZvciB0aGUgZW0yOHh4IGRyaXZlciBhcyBJIGRpZCBub3QgaGF2ZSBzdWNjZXNz
IG9uIHRoZSBrZXJuZWwgYnVnIHRyYWNrZXIuCj4gPiAKPiA+IFNpbmNlIEkgc3RhcnRlZCB1c2lu
ZyB0aGUgNS43LjAgcmNzIEkgYW0gZ2V0dGluZyBmb2xsb3dpbmcgY2FsbCB0cmFjZSB3aXRoIGEg
SGF1cHBhdWdlIFdpblRWLXNvbG9IRCB1c2luZyB0aGUgZW0yOHh4IGRyaXZlci4gT3RoZXIgdHVu
ZXJzIHdvcmsgYXMgZXhwZWN0ZWQuCj4gCj4gV2hhdCBrZXJuZWwgdmVyc2lvbiBhcmUgeW91IHVz
aW5nIGV4YWN0bHk/IEkgd291bGQgbm90IGV4cGVjdCB0aGlzIG9uIGEKPiB2NS43LjAtcmMqIHZl
cnNpb24sIHdpdGhvdXQgcGF0Y2hlcy4KPiAKPiBUaGVyZSBpcyBhIGZpeCBmb3IgdGhpcyBoZXJl
OiBodHRwczovL2dpdC5saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdpdC9jb21taXQvP2lkPTlmOTg0
Y2FjZjRmNGQ1M2ZkOGEzZjQ0ZDdmMTM1MjhiODFjMWY2YTgKPiAKPiBUaGFua3MKPiAKPiBTZWFu
Cj4gCj4gPiAKPiA+IAo+ID4gRG1lc2cgb3V0cHV0Ogo+ID4gCj4gPiBbICAgIDQuNTc2NDI5XSAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiA+IFsgICAgNC41NzY0MzhdIFdB
Uk5JTkc6IENQVTogNCBQSUQ6IDg5MSBhdCBkcml2ZXJzL21lZGlhL21jL21jLWVudGl0eS5jOjY2
OSBtZWRpYV9jcmVhdGVfcGFkX2xpbmsrMHgxY2QvMHgyMDAgW21jXQo+ID4gWyAgICA0LjU3NjQz
OV0gTW9kdWxlcyBsaW5rZWQgaW46IHNpMjE1NyBzaTIxNjggaTJjX211eCBlbTI4eHhfZHZiKCsp
IGR2Yl9jb3JlIGNtYWMgYWxnaWZfaGFzaCBhbGdpZl9za2NpcGhlciBhZl9hbGcgYm5lcCBidHVz
YiBidHJ0bCBidGJjbSBidGludGVsIGJsdWV0b290aCBzbmRfdXNiX2F1ZGlvIHV2Y3ZpZGVvIHZp
ZGVvYnVmMl92bWFsbG9jIHZpZGVvYnVmMl9tZW1vcHMgc25kX3VzYm1pZGlfbGliIHZpZGVvYnVm
Ml92NGwyIHNuZF9yYXdtaWRpIHZpZGVvYnVmMl9jb21tb24gZWNkaF9nZW5lcmljIHNuZF9zZXFf
ZGV2aWNlIGVjYyBlbTI4eHggdHZlZXByb20gdmlkZW9kZXYgbW91c2VkZXYgaW5wdXRfbGVkcyBq
b3lkZXYgbWMgcmZraWxsIGxtOTIgaXQ4NyBod21vbl92aWQgaGlkX2dlbmVyaWMgdXNiaGlkIGhp
ZCBlZGFjX21jZV9hbWQgYW1kZ3B1IGt2bV9hbWQga3ZtIG5sc19pc284ODU5XzEgbmxzX2NwNDM3
IHZmYXQgc25kX2hkYV9jb2RlY19yZWFsdGVrIGZhdCBzbmRfaGRhX2NvZGVjX2dlbmVyaWMgaXJx
YnlwYXNzIGxlZHRyaWdfYXVkaW8gc25kX2hkYV9jb2RlY19oZG1pIHNuZF9oZGFfaW50ZWwgc25k
X2ludGVsX2RzcGNmZyBncHVfc2NoZWQgc25kX2hkYV9jb2RlYyB0dG0gY3JjdDEwZGlmX3BjbG11
bCBjcmMzMl9wY2xtdWwgc25kX2hkYV9jb3JlIGdoYXNoX2NsbXVsbmlfaW50ZWwgd21pX2Jtb2Yg
bXhtX3dtaSBkcm1fa21zX2hlbHBlciBzbmRfaHdkZXAgc25kX3BjbSBpZ2IgY2VjIGFlc25pX2lu
dGVsIHJjX2NvcmUgc25kX3RpbWVyIGNjcCBzbmQgc3A1MTAwX3RjbyBjcnlwdG9fc2ltZCBzeXNj
b3B5YXJlYSBzeXNmaWxscmVjdCBjcnlwdGQgaTJjX2FsZ29fYml0IHN5c2ltZ2JsdCBwY3Nwa3Ig
azEwdGVtcCBpMmNfcGlpeDQgZ2x1ZV9oZWxwZXIgZGNhIGZiX3N5c19mb3BzIHNvdW5kY29yZSBy
bmdfY29yZSB3bWkgZXZkZXYgcGluY3RybF9hbWQgbWFjX2hpZCBhY3BpX2NwdWZyZXEgdmJveG5l
dGZsdChPRSkgdmJveG5ldGFkcChPRSkKPiA+IFsgICAgNC41NzY0ODZdICBkcm0gdmJveGRydihP
RSkgY3J5cHRvX3VzZXIgYWdwZ2FydCBpcF90YWJsZXMgeF90YWJsZXMgZXh0NCBjcmMzMmNfZ2Vu
ZXJpYyBjcmMxNiBtYmNhY2hlIGpiZDIgY3JjMzJjX2ludGVsIHhoY2lfcGNpIHhoY2lfaGNkCj4g
PiBbICAgIDQuNTc2NDk2XSBDUFU6IDQgUElEOiA4OTEgQ29tbTogbW9kcHJvYmUgVGFpbnRlZDog
RyAgICAgICAgICAgT0UgICAgIDUuNy4wLXJjNy0xLW1haW5saW5lICMxCj4gPiBbICAgIDQuNTc2
NDk3XSBIYXJkd2FyZSBuYW1lOiBHaWdhYnl0ZSBUZWNobm9sb2d5IENvLiwgTHRkLiBYNTcwIEFP
UlVTIFBSTy9YNTcwIEFPUlVTIFBSTywgQklPUyBGMTJlIDAzLzA2LzIwMjAKPiA+IFsgICAgNC41
NzY1MDJdIFJJUDogMDAxMDptZWRpYV9jcmVhdGVfcGFkX2xpbmsrMHgxY2QvMHgyMDAgW21jXQo+
ID4gWyAgICA0LjU3NjUwNV0gQ29kZTogNWYgYzMgMGYgMGIgNDggODMgYzQgMTAgYjggZWEgZmYg
ZmYgZmYgNWIgNWQgNDEgNWMgNDEgNWQgNDEgNWUgNDEgNWYgYzMgMGYgMGIgYjggZWEgZmYgZmYg
ZmYgZWIgZDIgMGYgMGIgYjggZWEgZmYgZmYgZmYgZWIgYzkgPDBmPiAwYiBiOCBlYSBmZiBmZiBm
ZiBlYiBjMCAwZiAwYiBiOCBlYSBmZiBmZiBmZiBlYiBiNyBiOCBmNCBmZiBmZgo+ID4gWyAgICA0
LjU3NjUwN10gUlNQOiAwMDE4OmZmZmZhNjcwNDExZDNhZjggRUZMQUdTOiAwMDAxMDI0Ngo+ID4g
WyAgICA0LjU3NjUwOV0gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZmEwZjlhN2Q3NTQw
MCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgICAgNC41NzY1MTBdIFJEWDogZmZmZmEwZjlh
OTdjZDMxMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgUkRJOiBmZmZmYTBmOWE5N2NkMjkwCj4gPiBb
ICAgIDQuNTc2NTEyXSBSQlA6IGZmZmZhMGY5YTk3Y2QyOTAgUjA4OiAwMDAwMDAwMDAwMDAwMDAx
IFIwOTogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgICA0LjU3NjUxM10gUjEwOiAwMDAwMDAwMDAw
MDAwMDAxIFIxMTogMDAwMDAwMDAwMDAwMDAwMSBSMTI6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsg
ICAgNC41NzY1MTRdIFIxMzogZmZmZmEwZjljMTNiMGNjOCBSMTQ6IGZmZmZhMGY5Y2JjYTEwMzgg
UjE1OiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgIDQuNTc2NTE2XSBGUzogIDAwMDA3ZjY3ODFl
YTI3NDAoMDAwMCkgR1M6ZmZmZmEwZjljZWIwMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAw
MDAwCj4gPiBbICAgIDQuNTc2NTE3XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAw
MDAwMDAwMDgwMDUwMDMzCj4gPiBbICAgIDQuNTc2NTE4XSBDUjI6IDAwMDA3ZjVkYjhiOGNjYjAg
Q1IzOiAwMDAwMDAwM2RmNjMwMDAwIENSNDogMDAwMDAwMDAwMDM0MGVlMAo+ID4gWyAgICA0LjU3
NjUyMF0gQ2FsbCBUcmFjZToKPiA+IFsgICAgNC41NzY1MzNdICBkdmJfY3JlYXRlX21lZGlhX2dy
YXBoKzB4NDhhLzB4NTkwIFtkdmJfY29yZV0KPiA+IFsgICAgNC41NzY1NDBdICBlbTI4eHhfZHZi
X2luaXQuY29sZCsweDEwMjgvMHgyNWU0IFtlbTI4eHhfZHZiXQo+ID4gWyAgICA0LjU3NjU1MF0g
IGVtMjh4eF9yZWdpc3Rlcl9leHRlbnNpb24rMHg1YS8weGIwIFtlbTI4eHhdCj4gPiBbICAgIDQu
NTc2NTU0XSAgPyAweGZmZmZmZmZmYzAzZGQwMDAKPiA+IFsgICAgNC41NzY1NThdICBkb19vbmVf
aW5pdGNhbGwrMHg1OS8weDI0MAo+ID4gWyAgICA0LjU3NjU2NF0gIGRvX2luaXRfbW9kdWxlKzB4
NWMvMHgyNjAKPiA+IFsgICAgNC41NzY1NjddICBsb2FkX21vZHVsZSsweDIxMzcvMHgyM2EwCj4g
PiBbICAgIDQuNTc2NTc0XSAgX19kb19zeXNfaW5pdF9tb2R1bGUrMHgxNzIvMHgxYTAKPiA+IFsg
ICAgNC41NzY1ODBdICBkb19zeXNjYWxsXzY0KzB4NDkvMHg5MAo+ID4gWyAgICA0LjU3NjU4NF0g
IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKPiA+IFsgICAgNC41NzY1
ODZdIFJJUDogMDAzMzoweDdmNjc4MWZjZjczZQo+ID4gWyAgICA0LjU3NjU4OV0gQ29kZTogNDgg
OGIgMGQgNTUgZjcgMGIgMDAgZjcgZDggNjQgODkgMDEgNDggODMgYzggZmYgYzMgNjYgMmUgMGYg
MWYgODQgMDAgMDAgMDAgMDAgMDAgOTAgZjMgMGYgMWUgZmEgNDkgODkgY2EgYjggYWYgMDAgMDAg
MDAgMGYgMDUgPDQ4PiAzZCAwMSBmMCBmZiBmZiA3MyAwMSBjMyA0OCA4YiAwZCAyMiBmNyAwYiAw
MCBmNyBkOCA2NCA4OSAwMSA0OAo+ID4gWyAgICA0LjU3NjU5MV0gUlNQOiAwMDJiOjAwMDA3ZmZj
YmU0NTdiNDggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDBhZgo+ID4g
WyAgICA0LjU3NjU5M10gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDU2MzYzOTYzZmZm
MCBSQ1g6IDAwMDA3ZjY3ODFmY2Y3M2UKPiA+IFsgICAgNC41NzY1OTRdIFJEWDogMDAwMDU2MzYz
ODlmZDM2OCBSU0k6IDAwMDAwMDAwMDAwMGUxNTggUkRJOiAwMDAwNTYzNjM5ZTRlNGUwCj4gPiBb
ICAgIDQuNTc2NTk1XSBSQlA6IDAwMDA1NjM2MzllNGU0ZTAgUjA4OiAwMDAwMDAwMDAwMDAwMDAw
IFIwOTogMDAwMDdmZmNiZTQ1NWI0OAo+ID4gWyAgICA0LjU3NjU5Nl0gUjEwOiAwMDAwMDAwMDAw
MDAwMDAxIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDA1NjM2Mzg5ZmQzNjgKPiA+IFsg
ICAgNC41NzY1OThdIFIxMzogMDAwMDAwMDAwMDAwMDAwMCBSMTQ6IDAwMDA1NjM2Mzk2NDAwNzAg
UjE1OiAwMDAwNTYzNjM5NjNmZmYwCj4gPiBbICAgIDQuNTc2NjAxXSAtLS1bIGVuZCB0cmFjZSAx
MmQzMzNiNjIxYTJhNjhjIF0tLS0KPiA+IAo+ID4gCj4gPiBUaGFua3MKPiA+IAo+ID4gSm9oYW4g
QnJldW5pbmdlcgo+ID4gCj4gPiAKPiAKCg==




