Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2844578E1
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 23:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbhKSWoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 17:44:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhKSWoH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 17:44:07 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB778C061574
        for <linux-media@vger.kernel.org>; Fri, 19 Nov 2021 14:41:04 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id s13so20596279wrb.3
        for <linux-media@vger.kernel.org>; Fri, 19 Nov 2021 14:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language;
        bh=OEtnAOHBTsG4c4sdw6/n60xBfW9zOtIiMBiWLRR+H00=;
        b=UQlp+dh0QTHk0s76JKG4cZE/CXlYiUt4//57/Tm0PGGxKfmt0vo5/BqjNgqRwrXFmg
         82y1kL2wTKtMqhSHvo8A60GLJbV7PJPCOfLLcPQ3Iz2eVHGvNDGhK44BhNU04IfixeXy
         bIsZJIoGXDCy0MZr4xMSsqqsPsy61VBE1SwrtdgYpfwb3aVU3WzBsHjGfxlfLsVo+6q0
         BHgTlo5SCGY4ktWWm4i1NuNZLzQJMr+g1seAsCt+wOOk9GTAQ0YjRSiJAG99CizXgkVi
         SLuuYIHzQkHFeMNJKWO7Id0xtXJBbcr8SYiimrnv8McEUGNfmkW/7S2kkf79Lb3H3eJP
         Q+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language;
        bh=OEtnAOHBTsG4c4sdw6/n60xBfW9zOtIiMBiWLRR+H00=;
        b=ElQmhMgF2QjZHRuAec88SMtpi4YL/PiX8xsHiguCnvKjEjwoACfxM8aH05ipGm/Jl9
         uKOLFXRxetO+bXVehc/VW547NS63Bvt4VpLW+w3lc01FydNq1aIBQCcIYlB8WufdOBWm
         vxgYA6/Iyyj3Wpp0WgIDd/58a/xQYugz+77Oo1K4j473dRXTfC3nAVD1zwh9SAo8ODYd
         SK1fvg79qyc5qhOzhKdhAoWWN3bFoyY7RS6mveDN+Bj5ZHzUS7SxArHYCkcy//veWB2u
         /H8H1slX9nSLlU3nUDpQXKwBKY+c7TEkgsXYfJbEB4E87zOrK1YmOHCbmTqdf36yoWa2
         guCw==
X-Gm-Message-State: AOAM532EVoGn99yDDdkceS7T8YdXjXKuo+sfTvpq98mmTqFlmHQrJ77W
        v7yVsX9pxe6FsUDVVTtAwkY=
X-Google-Smtp-Source: ABdhPJyX16kLU8+EB6sZIXif9FmztPram57gtXoXcTU1LuA23shcl81G6z3HjWBAFVFm4KEQ6A1+ag==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr11891249wrw.104.1637361663570;
        Fri, 19 Nov 2021 14:41:03 -0800 (PST)
Received: from [192.168.0.16] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id b197sm886700wmb.24.2021.11.19.14.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 14:41:03 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
Subject: Kernel oops bisected to media: videobuf2: move cache_hints handling
 to allocators
To:     senozhatsky@chromium.org, hverkuil-cisco@xs4all.nl,
        mchehab+huawei@kernel.org
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <d0dcd227-0753-5e9d-f757-4819cc271d4f@gmail.com>
Date:   Fri, 19 Nov 2021 22:41:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------85A3B8E22BC85B62BACDE658"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------85A3B8E22BC85B62BACDE658
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi all

I've been experiencing an oops trying to run libcamera's qcam util
(which starts streaming on a camera sensor - the ov8865), which I
bisected down to the patch cde513fd9b35: "media: videobuf2: move
cache_hints handling to allocators"

The traceback from the oops is attached, but the short version is a null
pointer dereference in vb2_dma_sg_prepare(). I tried the obvious patch:

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 1094575abf95..937f86b93013 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -204,7 +204,7 @@ static void vb2_dma_sg_prepare(void *buf_priv)
        struct vb2_dma_sg_buf *buf = buf_priv;
        struct sg_table *sgt = buf->dma_sgt;

-       if (buf->vb->skip_cache_sync_on_prepare)
+       if (buf->vb && buf->vb->skip_cache_sync_on_prepare)
                return;

        dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);


But that causes a complete lock when I try to stream. Reverting the
patch entirely on the other hand does work fine.

I'm not familiar with this code at all so not really sure what else to
try; any suggestions?

Thanks
Dan


--------------85A3B8E22BC85B62BACDE658
Content-Type: text/plain; charset=UTF-8;
 name="kernel oops.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="kernel oops.txt"

WyAgIDYzLjAwMDk3M10gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBh
ZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDVjClsgICA2My4wMDA5ODNdICNQRjogc3VwZXJ2aXNv
ciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQpbICAgNjMuMDAwOTg2XSAjUEY6IGVycm9y
X2NvZGUoMHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UKWyAgIDYzLjAwMDk4OV0gUEdEIDAg
UDREIDAgClsgICA2My4wMDA5OTRdIE9vcHM6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBQVEkK
WyAgIDYzLjAwMDk5OF0gQ1BVOiAxIFBJRDogMjA0NiBDb21tOiBxY2FtIFRhaW50ZWQ6IEcg
ICAgICAgICBDICAgICAgICA1LjE2LjAtcmMxKyAjNDE5ClsgICA2My4wMDEwMDNdIEhhcmR3
YXJlIG5hbWU6IE1pY3Jvc29mdCBDb3Jwb3JhdGlvbiBTdXJmYWNlIEdvIDIvU3VyZmFjZSBH
byAyLCBCSU9TIDEuMC4xNiAwNS8yNC8yMDIxClsgICA2My4wMDEwMDVdIFJJUDogMDAxMDp2
YjJfZG1hX3NnX3ByZXBhcmUrMHg5LzB4MzAgW3ZpZGVvYnVmMl9kbWFfc2ddClsgICA2My4w
MDEwMTVdIENvZGU6IDcwIDM4IDhiIDQ4IDI0IDQ4IDhiIDM4IDQ4IDg5IGU1IDhiIDU2IDA4
IDQ4IDhiIDM2IGU4IGZiIDJjIDYxIGRkIDMxIGMwIDVkIGMzIDBmIDFmIDgwIDAwIDAwIDAw
IDAwIDBmIDFmIDQ0IDAwIDAwIDQ4IDhiIDQ3IDcwIDxmNj4gNDAgNWMgMDggNzQgMDEgYzMg
NTUgNDggOGIgNDcgMzggOGIgNGYgMjQgNDggOGIgM2YgOGIgNTAgMGMgNDgKWyAgIDYzLjAw
MTAxOV0gUlNQOiAwMDE4OmZmZmZiMzI0YzA3ODdjNDAgRUZMQUdTOiAwMDAxMDI0NgpbICAg
NjMuMDAxMDIyXSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmOWEzMDk0MzIzODAw
IFJDWDogZmZmZjlhMmY1ZTVmNTllMApbICAgNjMuMDAxMDI1XSBSRFg6IGZmZmZmZmZmYzA3
MTgyNzAgUlNJOiBmZmZmOWEzMDk0MTZiMmMwIFJESTogZmZmZjlhMmY0MjFhNTcwMApbICAg
NjMuMDAxMDI4XSBSQlA6IGZmZmZiMzI0YzA3ODdjNjggUjA4OiAwMDAwMDAwMDAwMDAwMDAw
IFIwOTogZmZmZjlhMmY1ZTVmNTAwMApbICAgNjMuMDAxMDMwXSBSMTA6IGZmZmY5YTMwYWFj
YjY0NDggUjExOiAwMDAwMDAwMDAwMDAwMDA1IFIxMjogMDAwMDAwMDAwMDAwMDAwMApbICAg
NjMuMDAxMDMyXSBSMTM6IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiBmZmZmOWEzMDRjY2IwYTY4
IFIxNTogMDAwMDAwMDAwMDAwMDAwZgpbICAgNjMuMDAxMDM1XSBGUzogIDAwMDA3ZjRiMTFj
OTM2NDAoMDAwMCkgR1M6ZmZmZjlhMzBhYWM4MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAw
MDAwMDAwClsgICA2My4wMDEwMzhdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6
IDAwMDAwMDAwODAwNTAwMzMKWyAgIDYzLjAwMTA0MV0gQ1IyOiAwMDAwMDAwMDAwMDAwMDVj
IENSMzogMDAwMDAwMDEzYjNlMjAwMyBDUjQ6IDAwMDAwMDAwMDAzNzA2ZTAKWyAgIDYzLjAw
MTA0NF0gQ2FsbCBUcmFjZToKWyAgIDYzLjAwMTA0Nl0gIDxUQVNLPgpbICAgNjMuMDAxMDUw
XSAgPyBfX2J1Zl9wcmVwYXJlKzB4MTU0LzB4MWMwIFt2aWRlb2J1ZjJfY29tbW9uXQpbICAg
NjMuMDAxMDYwXSAgdmIyX2NvcmVfcWJ1ZisweDM5OS8weDRiMCBbdmlkZW9idWYyX2NvbW1v
bl0KWyAgIDYzLjAwMTA2OF0gIHZiMl9xYnVmKzB4NmYvMHhhMCBbdmlkZW9idWYyX3Y0bDJd
ClsgICA2My4wMDEwNzRdICA/IHZiMl9zdGFydF9zdHJlYW1pbmcrMHg2ZC8weDExMCBbdmlk
ZW9idWYyX2NvbW1vbl0KWyAgIDYzLjAwMTA4MV0gIHZiMl9pb2N0bF9xYnVmKzB4NGQvMHg2
MCBbdmlkZW9idWYyX3Y0bDJdClsgICA2My4wMDEwODddICB2NGxfcWJ1ZisweDQwLzB4NTAg
W3ZpZGVvZGV2XQpbICAgNjMuMDAxMTAxXSAgX192aWRlb19kb19pb2N0bCsweDFhNy8weDQw
MCBbdmlkZW9kZXZdClsgICA2My4wMDExMTVdICB2aWRlb191c2VyY29weSsweDM5Mi8weDhk
MCBbdmlkZW9kZXZdClsgICA2My4wMDExMjZdICA/IHY0bF9lbnVtc3RkKzB4MzAvMHgzMCBb
dmlkZW9kZXZdClsgICA2My4wMDExNDBdICB2aWRlb19pb2N0bDIrMHgxNS8weDIwIFt2aWRl
b2Rldl0KWyAgIDYzLjAwMTE1MV0gIHY0bDJfaW9jdGwrMHg0Yy8weDYwIFt2aWRlb2Rldl0K
WyAgIDYzLjAwMTE2MV0gIF9feDY0X3N5c19pb2N0bCsweDkxLzB4YzAKWyAgIDYzLjAwMTE2
Nl0gIGRvX3N5c2NhbGxfNjQrMHgzYi8weGMwClsgICA2My4wMDExNzBdICBlbnRyeV9TWVND
QUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGFlClsgICA2My4wMDExNzZdIFJJUDogMDAz
MzoweDdmNGIxZGYzYjMxYgpbICAgNjMuMDAxMTgwXSBDb2RlOiA4OSBkOCA0OSA4ZCAzYyAx
YyA0OCBmNyBkOCA0OSAzOSBjNCA3MiBiNSBlOCAxYyBmZiBmZiBmZiA4NSBjMCA3OCBiYSA0
YyA4OSBlMCA1YiA1ZCA0MSA1YyBjMyBmMyAwZiAxZSBmYSBiOCAxMCAwMCAwMCAwMCAwZiAw
NSA8NDg+IDNkIDAxIGYwIGZmIGZmIDczIDAxIGMzIDQ4IDhiIDBkIDFkIDNiIDBkIDAwIGY3
IGQ4IDY0IDg5IDAxIDQ4ClsgICA2My4wMDExODNdIFJTUDogMDAyYjowMDAwN2Y0YjExYzkx
YTY4IEVGTEFHUzogMDAwMDAyMDIgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMTAKWyAgIDYz
LjAwMTE4N10gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDdmNGFmYzAxZTQyMCBS
Q1g6IDAwMDA3ZjRiMWRmM2IzMWIKWyAgIDYzLjAwMTE4OV0gUkRYOiAwMDAwN2Y0YjExYzkx
YjYwIFJTSTogMDAwMDAwMDBjMDU4NTYwZiBSREk6IDAwMDAwMDAwMDAwMDAwMjUKWyAgIDYz
LjAwMTE5Ml0gUkJQOiAwMDAwN2Y0YjExYzkxYTkwIFIwODogMDAwMDdmNGIwMDAwMGVkMCBS
MDk6IDAwMDA3ZjRiMWRmOGQ1ODAKWyAgIDYzLjAwMTE5NF0gUjEwOiAwMDAwMDAwMDAwMDAw
MDAxIFIxMTogMDAwMDAwMDAwMDAwMDIwMiBSMTI6IDAwMDA1NjNhNTJhMWVjODQKWyAgIDYz
LjAwMTE5Nl0gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDAwMCBS
MTU6IDAwMDA3ZjRiMTFjOTM2NDAKWyAgIDYzLjAwMTIwMV0gIDwvVEFTSz4KWyAgIDYzLjAw
MTIwM10gTW9kdWxlcyBsaW5rZWQgaW46IHJmY29tbSBjY20gY21hYyBhbGdpZl9oYXNoIGFs
Z2lmX3NrY2lwaGVyIGFmX2FsZyBibmVwIG5sc19pc284ODU5XzEgeDg2X3BrZ190ZW1wX3Ro
ZXJtYWwgaW50ZWxfcG93ZXJjbGFtcCBjb3JldGVtcCBpbnRlbF9yYXBsX21zciBkdzk3MTkg
a3ZtX2ludGVsIGt2bSBzbmRfc29jX3NrbCBzbmRfc29jX3NzdF9pcGMgc25kX3NvY19zc3Rf
ZHNwIHNuZF9oZGFfZXh0X2NvcmUgc25kX3NvY19hY3BpX2ludGVsX21hdGNoIHNuZF9zb2Nf
YWNwaSBpcnFieXBhc3Mgc25kX3NvY19jb3JlIGNyY3QxMGRpZl9wY2xtdWwgZ2hhc2hfY2xt
dWxuaV9pbnRlbCBzbmRfaGRhX2NvZGVjX2hkbWkgc25kX2NvbXByZXNzIGFlc25pX2ludGVs
IHNuZF9oZGFfY29kZWNfcmVhbHRlayBhYzk3X2J1cyBzbmRfaGRhX2NvZGVjX2dlbmVyaWMg
bGVkdHJpZ19hdWRpbyBjcnlwdG9fc2ltZCBjcnlwdGQgc25kX3BjbV9kbWFlbmdpbmUgc25k
X2hkYV9pbnRlbCBzbmRfaW50ZWxfZHNwY2ZnIHNuZF9oZGFfY29kZWMgc25kX2hkYV9jb3Jl
IHJhcGwgc25kX2h3ZGVwIHNuZF9wY20gaW50ZWxfY3N0YXRlIGpveWRldiBzbmRfc2VxX21p
ZGkgc25kX3NlcV9taWRpX2V2ZW50IHNuZF9yYXdtaWRpIGVmaV9wc3RvcmUgaW50ZWxfd21p
X3RodW5kZXJib2x0IHNuZF9zZXEgaXdsbXZtIHNuZF9zZXFfZGV2aWNlIHNuZF90aW1lciBp
bnB1dF9sZWRzIG1hYzgwMjExIHNlcmlvX3JhdyBzbmQgbGliYXJjNCBpOTE1IGJ0dXNiIHdt
aV9ibW9mIGl3bHdpZmkgYnRydGwgc291bmRjb3JlIGJ0YmNtIGJ0aW50ZWwgY2VjIGJsdWV0
b290aCByY19jb3JlIGNmZzgwMjExIGhpZF9zZW5zb3JfZ3lyb18zZCBoaWRfc2Vuc29yX2Fj
Y2VsXzNkIGhpZF9zZW5zb3JfYWxzIGhpZF9zZW5zb3Jfcm90YXRpb24gdHRtIGVjZGhfZ2Vu
ZXJpYyBoaWRfc2Vuc29yX3RyaWdnZXIgZWNjIGluZHVzdHJpYWxpb190cmlnZ2VyZWRfYnVm
ZmVyIGRybV9rbXNfaGVscGVyClsgICA2My4wMDEyNzddICA4MjUwX2R3IGhpZF9tdWx0aXRv
dWNoIGtmaWZvX2J1ZiBpMmNfYWxnb19iaXQgcHJvY2Vzc29yX3RoZXJtYWxfZGV2aWNlX3Bj
aV9sZWdhY3kgcHJvY2Vzc29yX3RoZXJtYWxfZGV2aWNlIGhpZF9zZW5zb3JfaWlvX2NvbW1v
biBpcHUzX2ltZ3UoQykgaXB1M19jaW8yIHByb2Nlc3Nvcl90aGVybWFsX3JmaW0gZmJfc3lz
X2ZvcHMgcHJvY2Vzc29yX3RoZXJtYWxfbWJveCBzeXNjb3B5YXJlYSB1Y3NpX2FjcGkgdmlk
ZW9idWYyX2RtYV9zZyBzeXNmaWxscmVjdCBwcm9jZXNzb3JfdGhlcm1hbF9yYXBsIGluZHVz
dHJpYWxpbyBzeXNpbWdibHQgaW50ZWxfcGNoX3RoZXJtYWwgbWVpX21lIHZpZGVvYnVmMl9t
ZW1vcHMgaW50ZWxfcmFwbF9jb21tb24gdmlkZW9idWYyX3Y0bDIgdHlwZWNfdWNzaSBpbnRl
bF9zb2NfZHRzX2lvc2YgdmlkZW9idWYyX2NvbW1vbiBtZWkgdHlwZWMgc29jX2J1dHRvbl9h
cnJheSBvdjg4NjUgdjRsMl9md25vZGUgaW50ZWxfc2tsX2ludDM0NzJfdHBzNjg0NzAgdHBz
Njg0NzBfcmVndWxhdG9yIHY0bDJfYXN5bmMgY2xrX3RwczY4NDcwIHZpZGVvZGV2IG1jIGlu
dDM0MDNfdGhlcm1hbCBpbnRlbF9za2xfaW50MzQ3Ml9kaXNjcmV0ZSBpbnRlbF9oaWQgbWFj
X2hpZCBzcGFyc2Vfa2V5bWFwIGludDM0MHhfdGhlcm1hbF96b25lIGludDM0MDBfdGhlcm1h
bCBhY3BpX3BhZCBhY3BpX3RoZXJtYWxfcmVsIHNjaF9mcV9jb2RlbCBwYXJwb3J0X3BjIHBw
ZGV2IGxwIGRybSBwYXJwb3J0IGlwX3RhYmxlcyB4X3RhYmxlcyBhdXRvZnM0IGhpZF9zZW5z
b3JfaHViIGludGVsX2lzaHRwX2hpZCBtbWNfYmxvY2sgaGlkX2dlbmVyaWMgcnRzeF9wY2lf
c2RtbWMgdXNiaGlkIGNyYzMyX3BjbG11bCBzZGhjaV9wY2kgY3FoY2kgc2RoY2kgcnRzeF9w
Y2kgaW50ZWxfaXNoX2lwYyBpbnRlbF9pc2h0cCBpbnRlbF9scHNzX3BjaSBpMmNfaGlkX2Fj
cGkgaW50ZWxfbHBzcyBpMmNfaGlkIGlkbWE2NCB2aXJ0X2RtYSBoaWQgd21pIHZpZGVvClsg
ICA2My4wMDEzNDVdICBwaW5jdHJsX3N1bnJpc2Vwb2ludApbICAgNjMuMDAxMzUxXSBDUjI6
IDAwMDAwMDAwMDAwMDAwNWMKWyAgIDYzLjAwMTM1NF0gLS0tWyBlbmQgdHJhY2UgMWJlMTg3
YzU3NDNjNjMxMyBdLS0tClsgICA2My4yODQyNzBdIFJJUDogMDAxMDp2YjJfZG1hX3NnX3By
ZXBhcmUrMHg5LzB4MzAgW3ZpZGVvYnVmMl9kbWFfc2ddClsgICA2My4yODQyODZdIENvZGU6
IDcwIDM4IDhiIDQ4IDI0IDQ4IDhiIDM4IDQ4IDg5IGU1IDhiIDU2IDA4IDQ4IDhiIDM2IGU4
IGZiIDJjIDYxIGRkIDMxIGMwIDVkIGMzIDBmIDFmIDgwIDAwIDAwIDAwIDAwIDBmIDFmIDQ0
IDAwIDAwIDQ4IDhiIDQ3IDcwIDxmNj4gNDAgNWMgMDggNzQgMDEgYzMgNTUgNDggOGIgNDcg
MzggOGIgNGYgMjQgNDggOGIgM2YgOGIgNTAgMGMgNDgKWyAgIDYzLjI4NDI5MV0gUlNQOiAw
MDE4OmZmZmZiMzI0YzA3ODdjNDAgRUZMQUdTOiAwMDAxMDI0NgpbICAgNjMuMjg0Mjk1XSBS
QVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmOWEzMDk0MzIzODAwIFJDWDogZmZmZjlh
MmY1ZTVmNTllMApbICAgNjMuMjg0Mjk4XSBSRFg6IGZmZmZmZmZmYzA3MTgyNzAgUlNJOiBm
ZmZmOWEzMDk0MTZiMmMwIFJESTogZmZmZjlhMmY0MjFhNTcwMApbICAgNjMuMjg0MzAxXSBS
QlA6IGZmZmZiMzI0YzA3ODdjNjggUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogZmZmZjlh
MmY1ZTVmNTAwMApbICAgNjMuMjg0MzAzXSBSMTA6IGZmZmY5YTMwYWFjYjY0NDggUjExOiAw
MDAwMDAwMDAwMDAwMDA1IFIxMjogMDAwMDAwMDAwMDAwMDAwMApbICAgNjMuMjg0MzA1XSBS
MTM6IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiBmZmZmOWEzMDRjY2IwYTY4IFIxNTogMDAwMDAw
MDAwMDAwMDAwZgpbICAgNjMuMjg0MzA4XSBGUzogIDAwMDA3ZjRiMTFjOTM2NDAoMDAwMCkg
R1M6ZmZmZjlhMzBhYWM4MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwClsgICA2
My4yODQzMTFdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAw
NTAwMzMKWyAgIDYzLjI4NDMxNF0gQ1IyOiAwMDAwMDAwMDAwMDAwMDVjIENSMzogMDAwMDAw
MDEzYjNlMjAwNCBDUjQ6IDAwMDAwMDAwMDAzNzA2ZTAKCgo=
--------------85A3B8E22BC85B62BACDE658--
