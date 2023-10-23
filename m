Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3E67D3421
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 13:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234166AbjJWLg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 07:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbjJWLg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 07:36:57 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BAA9DB
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 04:36:53 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9c603e2354fso664976566b.1
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698061012; x=1698665812; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wu4PKdQzvSlrJLjIcUeivuF3YzGvVnV25VOffl9ibWw=;
        b=Us6CPc8ixO/X1AvqaGSOuUyBlm4FUDvAGh+B/FC2QUqYTvYIxC1dCEmiQDjtJvsSmr
         en52iDuomUOO3Dh22pEGHpRjPF4EgNCokVht/lkSawhz2BWNdyrc2xh582v1r1uRzXmK
         WiUf+SrDIafWwrpky2giPTKOK3uy/PPQNCuGlOS4X+SPVC/zly6mzajMDpQa673um2Fa
         zWyVuwgN2heQeMamAQ2xEAxauj+sNDvEb6zbqtzK9BQ+OOHslAphXNQMV7d3PJCFbeWY
         QJpBypEIlBOjndhldFR2rbSksoUT6xZ4wByAcBnuXy73IQFuSdWBmVRcAh+C9V+SS1Sv
         uwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698061012; x=1698665812;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wu4PKdQzvSlrJLjIcUeivuF3YzGvVnV25VOffl9ibWw=;
        b=ZEMxHfUDNZh0rDia3/DZnFM/xku66+cl3Hbv6jRn+b7rt1W9krt9yOHyW6MP/rqCN2
         6OOp5qfy1AVH0fazRergEPEze/Tq8y4I8aPK73wSP5NaRDLvOJ/N9BbA1MBqH4wDSSVb
         UVXYcCtt8HiJPYTqC+sRiFsjc9GK2K+cgBuxbe+9cJDwZbKL4mASB2omyLq3YvZltml/
         hNwrdiZTg6BruXIzyTNM1+GTB+OY8/w2kFUqbnGj3//htGyiU+UhPFaROeY9P+A7JsQ+
         5oh889cb0QFAvFQXP+muZfAispDeMFgfJ1JrpQIdFMgwGRsM4/CyzD2gUTMgZQ7LwVcl
         Bepg==
X-Gm-Message-State: AOJu0Yw609DQy3SpopoMX+RZMxIqwGprahikmSnVBlQ92BXIThNMFUGG
        baGd3lZnfZ6nmCRo+A1A2pU=
X-Google-Smtp-Source: AGHT+IENvNIUGkftyV1/wU2VYTTsPgEhBtyCAunESJRPlDwro0nNwmUhz8pzme2hcN3OzSC/FeBqoQ==
X-Received: by 2002:a17:907:6e8c:b0:9a1:b85d:c952 with SMTP id sh12-20020a1709076e8c00b009a1b85dc952mr8751806ejc.12.1698061011675;
        Mon, 23 Oct 2023 04:36:51 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id xa22-20020a170907b9d600b0099bd1ce18fesm6578525ejc.10.2023.10.23.04.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 04:36:51 -0700 (PDT)
Message-ID: <7520f6fe08a32cfc9f196639c1a6febbb3229bd4.camel@gmail.com>
Subject: Re: [PATCH 11/15] media: intel/ipu6: input system video capture
 nodes
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Date:   Mon, 23 Oct 2023 13:36:50 +0200
In-Reply-To: <20230727071558.1148653-12-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <20230727071558.1148653-12-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIzLTA3LTI3IGF0IDE1OjE1ICswODAwLCBiaW5nYnUuY2FvQGludGVsLmNvbSB3
cm90ZToKPiBGcm9tOiBCaW5nYnUgQ2FvIDxiaW5nYnUuY2FvQGludGVsLmNvbT4KPiAKPiBSZWdp
c3RlciB2NGwyIHZpZGVvIGRldmljZSBhbmQgc2V0dXAgdGhlIHZiMiBxdWV1ZSB0bwo+IHN1cHBv
cnQgYmFzaWMgdmlkZW8gY2FwdHVyZS4gVmlkZW8gc3RyZWFtaW5nIGNhbGxiYWNrCj4gd2lsbCB0
cmlnZ2VyIHRoZSBpbnB1dCBzeXN0ZW0gZHJpdmVyIHRvIGNvbnN0cnVjdCBhCj4gaW5wdXQgc3lz
dGVtIHN0cmVhbSBjb25maWd1cmF0aW9uIGZvciBmaXJtd2FyZSBiYXNlZCBvbgo+IGRhdGEgdHlw
ZSBhbmQgc3RyZWFtIElEIGFuZCB0aGVuIHF1ZXVlIGJ1ZmZlcnMgdG8gZmlybXdhcmUKPiB0byBk
byBjYXB0dXJlLgouLi4KPiArc3RhdGljIGludCBzdGFydF9zdHJlYW1pbmcoc3RydWN0IHZiMl9x
dWV1ZSAqcSwgdW5zaWduZWQgaW50IGNvdW50KQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0
IGlwdTZfaXN5c19xdWV1ZSAqYXEgPSB2YjJfcXVldWVfdG9faXB1Nl9pc3lzX3F1ZXVlKHEpOwo+
ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpcHU2X2lzeXNfdmlkZW8gKmF2ID0gaXB1Nl9pc3lzX3F1
ZXVlX3RvX3ZpZGVvKGFxKTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
YXYtPmlzeXMtPmFkZXYtPmF1eGRldi5kZXY7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGlwdTZf
aXN5c19idWZmZXJfbGlzdCBfX2JsLCAqYmwgPSBOVUxMOwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCBpcHU2X2lzeXNfc3RyZWFtICpzdHJlYW07Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IG1lZGlh
X2VudGl0eSAqc291cmNlX2VudGl0eSA9IE5VTEw7Cj4gK8KgwqDCoMKgwqDCoMKgaW50IG5yX3F1
ZXVlcywgcmV0Owo+ICsKPiArwqDCoMKgwqDCoMKgwqBkZXZfZGJnKGRldiwgInN0cmVhbTogJXM6
IHdpZHRoICV1LCBoZWlnaHQgJXUsIGNzcwo+IHBpeGVsZm9ybWF0ICV1XG4iLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhdi0+dmRldi5uYW1lLCBhdi0+bXBpeC53aWR0aCwgYXYt
Pm1waXguaGVpZ2h0LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhdi0+cGZtdC0+
Y3NzX3BpeGVsZm9ybWF0KTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gaXB1Nl9pc3lzX3Nl
dHVwX3ZpZGVvKGF2LCAmc291cmNlX2VudGl0eSwgJm5yX3F1ZXVlcyk7Cj4gK8KgwqDCoMKgwqDC
oMKgaWYgKHJldCA8IDApIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2Vy
cihkZXYsICJmYWlsZWQgdG8gc2V0dXAgdmlkZW9cbiIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBnb3RvIG91dF9yZXR1cm5fYnVmZmVyczsKPiArwqDCoMKgwqDCoMKgwqB9Cj4g
Kwo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IGFxLT5saW5rX2ZtdF92YWxpZGF0ZShhcSk7Cj4gK8Kg
wqDCoMKgwqDCoMKgaWYgKHJldCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBk
ZXZfZXJyKGRldiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCIlczogbGluayBmb3JtYXQgdmFsaWRhdGlvbiBmYWlsZWQgKCVkKVxuIiwKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGF2LT52ZGV2Lm5hbWUsIHJl
dCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0X3BpcGVsaW5lX3N0
b3A7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXQgPSBpcHU2X2lz
eXNfZndfb3Blbihhdi0+aXN5cyk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXRfcGlwZWxpbmVfc3RvcDsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgc3RyZWFtID0gYXYtPnN0cmVhbTsKCi4uLgo+ICtvdXRfcGlwZWxpbmVfc3Rv
cDoKPiArwqDCoMKgwqDCoMKgwqB2aWRlb19kZXZpY2VfcGlwZWxpbmVfc3RvcCgmYXYtPnZkZXYp
Owo+ICvCoMKgwqDCoMKgwqDCoGlwdTZfaXN5c19wdXRfc3RyZWFtKHN0cmVhbSk7Cj4gK8KgwqDC
oMKgwqDCoMKgYXYtPnN0cmVhbSA9IE5VTEw7CgppZiBpcHU2X2lzeXNfZndfb3BlbiBmYWlscywg
c3RyZWFtIGlzIHVuaW5pdGlhbGl6ZWQgaGVyZS4gU2hvdWxkIGJlIGF2LQo+c3RyZWFtLgoKSSB0
aGluayBpdCB3b3VsZCBiZSBjbGVhbmVyIGlmIHlvdSB3cmFwcGVkIHRoZSBhYm92ZSB0aHJlZSBs
aW5lcyBpbiBhCmNsZWFudXAgZnVuY3Rpb24gdGhhdCBjbGVhbnMgdXAgd2hhdGV2ZXIgaXB1Nl9p
c3lzX3NldHVwX3ZpZGVvIGRvZXMuCgpUaGF0IGZ1bmN0aW9uIGNvdWxkIHByb2JhYmx5IGFsc28g
YmUgdXNlZCBpbiBzdG9wX3N0cmVhbWluZywgd2hlcmUgdGhlCnNhbWUgdGhyZWUgbGluZXMgYXJl
IGR1cGxpY2F0ZWQgKGFsdGhvdWdoIHdpdGggb3RoZXIgY29kZSBpbiBiZXR3ZWVuLApzbyBtYXkg
bm90IGJlIHRyaXZpYWwpLiBTZWUgYmVsb3c6CgouLi4KPiArc3RhdGljIHZvaWQgc3RvcF9zdHJl
YW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqcSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBp
cHU2X2lzeXNfcXVldWUgKmFxID0gdmIyX3F1ZXVlX3RvX2lwdTZfaXN5c19xdWV1ZShxKTsKPiAr
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaXB1Nl9pc3lzX3ZpZGVvICphdiA9IGlwdTZfaXN5c19xdWV1
ZV90b192aWRlbyhhcSk7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGlwdTZfaXN5c19zdHJlYW0g
KnN0cmVhbSA9IGF2LT5zdHJlYW07Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlwdTZfaXN5c19zZXRf
Y3NpMl9zdHJlYW1zX3N0YXR1cyhhdiwgZmFsc2UpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBtdXRl
eF9sb2NrKCZzdHJlYW0tPm11dGV4KTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaXB1Nl9pc3lzX3Vw
ZGF0ZV9zdHJlYW1fd2F0ZXJtYXJrKGF2LCBmYWxzZSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoG11
dGV4X2xvY2soJmF2LT5pc3lzLT5zdHJlYW1fbXV0ZXgpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChz
dHJlYW0tPm5yX3N0cmVhbWluZyA9PSBzdHJlYW0tPm5yX3F1ZXVlcyAmJiBzdHJlYW0tCj4gPnN0
cmVhbWluZykKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaXB1Nl9pc3lzX3ZpZGVv
X3NldF9zdHJlYW1pbmcoYXYsIDAsIE5VTEwpOwo+ICvCoMKgwqDCoMKgwqDCoG11dGV4X3VubG9j
aygmYXYtPmlzeXMtPnN0cmVhbV9tdXRleCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHZpZGVvX2Rl
dmljZV9waXBlbGluZV9zdG9wKCZhdi0+dmRldik7Cj4gK8KgwqDCoMKgwqDCoMKgYXYtPnN0cmVh
bSA9IE5VTEw7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHN0cmVhbS0+bnJfc3RyZWFtaW5nLS07Cj4g
K8KgwqDCoMKgwqDCoMKgbGlzdF9kZWwoJmFxLT5ub2RlKTsKPiArwqDCoMKgwqDCoMKgwqBzdHJl
YW0tPnN0cmVhbWluZyA9IDA7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmc3Ry
ZWFtLT5tdXRleCk7Cj4gK8KgwqDCoMKgwqDCoMKgaXB1Nl9pc3lzX3B1dF9zdHJlYW0oc3RyZWFt
KTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuX2J1ZmZlcnMoYXEsIFZCMl9CVUZfU1RBVEVf
RVJST1IpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpcHU2X2lzeXNfZndfY2xvc2UoYXYtPmlzeXMp
Owo+ICt9CgoKL0FuZHJlYXMK

