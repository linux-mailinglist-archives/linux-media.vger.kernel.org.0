Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5CE2EAF9E
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 17:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbhAEQGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 11:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbhAEQGq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 11:06:46 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF24CC061795
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 08:06:05 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b26so73819158lff.9
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 08:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M5MlVB+OeSv9vx9YQRSNIPVW4J2RDsOrRoVlGjoC8RU=;
        b=PGW2+1B/7OgyMb+IZY1+QV9zkkbr2eIoSZvY8P4nLTLiukPD8JEy07zzvaey8bf/vR
         eQxYWjrpeameXMNpej1AisT7EQW4q1g7CcB7dxw4ejXzmYthvCljf2w6lxuTNCmpDuXM
         eyC9WbxmYxhelc8uHdEsG4oCPNrEDAhv9bSshj3eY5BHqmymHp3u/d19rHCX8Dw39IKu
         POa1mTb3pxWtdMDth2SX16oUd1tMzzi2vqmrimqr0h3/laKF0KT+feW0UilU5rUizoxl
         ehV1HcmgZaszmG6h01El//xccIffFf3aXKALAQgRNZRhmOk9a6TAZ2O4tgvQjrJ2tn/k
         +g8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5MlVB+OeSv9vx9YQRSNIPVW4J2RDsOrRoVlGjoC8RU=;
        b=f8PPkIQ3BySSE3WULTLFi6PpZR5Cn3nt9dzIn6GtplJqCzOdO7omFfQCcJVRBcNxuB
         sN3+OKPwKGn5X6gGdFVsfaQexfoIRq1Y+/wEtckmqIKgDqslD9+hDRRcl/D4x7EXdaI8
         HP3B4kz7N6Yf52MzC91gDR81FoxZt2H98/35zJM3dEbL1I8KvvVP0dNVMO44uRrkUd9s
         Im2Pf6WWe35BVXMp3nz7l4/GGA8kHyvU/fFCD8Ww6ccOERIvu1f25U2bbt9eMfT3cOVl
         chY3uIs3w8tZ+1HpdJgnKnUJwSReUtGGCblkgrOdHXluQ/uNjRxOMoVIPvmvGH57xQcZ
         2Ggw==
X-Gm-Message-State: AOAM532MrLaQvw9fwNcPwigcNHDDKr3t55CAKyk3QsxwsUPe0blpPW+e
        pVBiPXWseep5Yvx5BBKk5jX19g74JQGI9jtREk8eBxh8Q90=
X-Google-Smtp-Source: ABdhPJz5HlhmM8QpNv4QORMdJoY/OTxxGT+MezNU5yzkwv2BLxQDLTHomrCmoxkTHewgrOJ84xxfImK86vYy5Mb1OBM=
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr140888ljo.490.1609862764093;
 Tue, 05 Jan 2021 08:06:04 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com> <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
 <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
 <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com> <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
 <CAOMZO5BkbB7KHP3pz1SLgD1Vth-BcZAEuxsaSQJ83Y6O=DDPdg@mail.gmail.com>
 <CAOMZO5D1Lk6evyRZ08erQ3DaVgSHubGjGbK8dcKao=NS+m-PUA@mail.gmail.com> <20210105150129.fresebmib75htyl5@arch-thunder.localdomain>
In-Reply-To: <20210105150129.fresebmib75htyl5@arch-thunder.localdomain>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 5 Jan 2021 13:05:52 -0300
Message-ID: <CAOMZO5D+GGM_QPc0=nWEYe=XV1EBgUS7ff+t+0aER-fg+a4PKA@mail.gmail.com>
Subject: Re: imx6ull capture from OV5640
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: multipart/mixed; boundary="000000000000315e3905b82962ed"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--000000000000315e3905b82962ed
Content-Type: text/plain; charset="UTF-8"

Hi Rui,

On Tue, Jan 5, 2021 at 12:01 PM Rui Miguel Silva <rmfrfs@gmail.com> wrote:

> can you see if the following patch make it work again?

Yes, with your patch and mine I can capture the same way as with the
5.4 kernel :-)

The pink color issue is still present but it is orthogonal to this problem.

Could you please submit your patch formally to the list? Please
include my attached patch as 1/2 and yours as 2/2.

Also, please add the following tag to your patch:

Tested-by: Fabio Estevam <festevam@gmail.com>

Thanks,

Fabio Estevam

--000000000000315e3905b82962ed
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-csimux.patch"
Content-Disposition: attachment; filename="0001-csimux.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kjk6nt940>
X-Attachment-Id: f_kjk6nt940

RnJvbSA0ZjBlMGY3OTM3NjY2ZGVmM2EzZmExZmY4NjMwZDA5YjIxMzg0MWQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+CkRh
dGU6IFR1ZSwgNSBKYW4gMjAyMSAxMTowNjo1NCAtMDMwMApTdWJqZWN0OiBbUEFUQ0ggMS8yXSBt
ZWRpYTogaW14NzogY3NpOiBGaXggcmVncmVzc2lvbiBmb3IgcGFyYWxsZWwgY2FtZXJhcyBvbiBp
Lk1YNlVMCgpDb21taXQgODZlMDJkMDc4NzFjICgibWVkaWE6IGlteDUvNi83OiBjc2k6IE1hcmsg
YSBib3VuZCB2aWRlbyBtdXggYXMKYSBDU0kgbXV4IikgbWFkZSBhbiBpbmNvcnJlY3QgYXNzdW1w
dGlvbiB0aGF0IGZvciBpbXg3LW1lZGlhLWNzaSwKdGhlIGJvdW5kIHN1YmRldiBtdXN0IGFsd2F5
cyBiZSBhIENTSSBtdXguIE9uIGkuTVg2VUwvaS5NWDZVTEwgdGhlcmUKaXMgbm8gQ1NJIG11eCBh
dCBhbGwsIHNvIGRvIG5vdCByZXR1cm4gYW4gZXJyb3Igd2hlbiB0aGUgZW50aXR5IGlzIG5vdCBh
CnZpZGVvIG11eCBhbmQgYXNzaWduIHRoZSBJTVhfTUVESUFfR1JQX0lEX0NTSV9NVVggZ3JvdXAg
aWQgb25seSB3aGVuCmFwcHJvcHJpYXRlLgoKVGhpcyBpcyB0aGUgc2FtZSBhcHByb2FjaCBhcyBk
b25lIGluIGlteC1tZWRpYS1jc2kuYyBhbmQgaXQgZml4ZXMgdGhlCmNzaSBwcm9iZSByZWdyZXNz
aW9uIG9uIGkuTVg2VUwuCgpUZXN0ZWQgb24gYSBpbXg2dWxsLWV2ayBib2FyZC4KCkZpeGVzOiA4
NmUwMmQwNzg3MWMgKCJtZWRpYTogaW14NS82Lzc6IGNzaTogTWFyayBhIGJvdW5kIHZpZGVvIG11
eCBhcyBhIENTSSBtdXgiKQpTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL21lZGlhL2lteC9pbXg3LW1lZGlhLWNzaS5j
IHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9pbXgvaW14Ny1t
ZWRpYS1jc2kuYyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9pbXgvaW14Ny1tZWRpYS1jc2kuYwpp
bmRleCBhM2YzZGY5MDE3MDQuLjMxZTM2MTY4ZjlkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFn
aW5nL21lZGlhL2lteC9pbXg3LW1lZGlhLWNzaS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRp
YS9pbXgvaW14Ny1tZWRpYS1jc2kuYwpAQCAtMTE2NCwxMiArMTE2NCwxMiBAQCBzdGF0aWMgaW50
IGlteDdfY3NpX25vdGlmeV9ib3VuZChzdHJ1Y3QgdjRsMl9hc3luY19ub3RpZmllciAqbm90aWZp
ZXIsCiAJc3RydWN0IGlteDdfY3NpICpjc2kgPSBpbXg3X2NzaV9ub3RpZmllcl90b19kZXYobm90
aWZpZXIpOwogCXN0cnVjdCBtZWRpYV9wYWQgKnNpbmsgPSAmY3NpLT5zZC5lbnRpdHkucGFkc1tJ
TVg3X0NTSV9QQURfU0lOS107CiAKLQkvKiBUaGUgYm91bmQgc3ViZGV2IG11c3QgYWx3YXlzIGJl
IHRoZSBDU0kgbXV4ICovCi0JaWYgKFdBUk5fT04oc2QtPmVudGl0eS5mdW5jdGlvbiAhPSBNRURJ
QV9FTlRfRl9WSURfTVVYKSkKLQkJcmV0dXJuIC1FTlhJTzsKLQotCS8qIE1hcmsgaXQgYXMgc3Vj
aCB2aWEgaXRzIGdyb3VwIGlkICovCi0Jc2QtPmdycF9pZCA9IElNWF9NRURJQV9HUlBfSURfQ1NJ
X01VWDsKKwkvKgorCSAqIElmIHRoZSBzdWJkZXYgaXMgYSB2aWRlbyBtdXgsIGl0IG11c3QgYmUg
b25lIG9mIHRoZSBDU0kKKwkgKiBtdXhlcy4gTWFyayBpdCBhcyBzdWNoIHZpYSBpdHMgZ3JvdXAg
aWQuCisJICovCisJaWYgKHNkLT5lbnRpdHkuZnVuY3Rpb24gPT0gTUVESUFfRU5UX0ZfVklEX01V
WCkKKwkJc2QtPmdycF9pZCA9IElNWF9NRURJQV9HUlBfSURfQ1NJX01VWDsKIAogCXJldHVybiB2
NGwyX2NyZWF0ZV9md25vZGVfbGlua3NfdG9fcGFkKHNkLCBzaW5rKTsKIH0KLS0gCjIuMTcuMQoK
--000000000000315e3905b82962ed--
