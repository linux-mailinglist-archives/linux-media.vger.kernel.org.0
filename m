Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC296D022C
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 12:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjC3KyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 06:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjC3KyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 06:54:05 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECDA4C2F
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 03:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1680173642; i=ps.report@gmx.net;
        bh=ZC+moYAoF6F4q/kHx72N2lUYVhH/z2ODiG/4FhABYRo=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=RZKp0zxM1viA9ITTgYoknIg9PgPb/+6MPxMbrQu+FgkAySnEejVlzayHxkPFl5KWk
         RkB4qIAYmvyQ0TAhJYM4XAQC3VQ+3HoyQZsUeAE6B8th3ILYuWJt+32VtvgoW+J1dK
         t/dkyixG1eaIJMqrZRyGMLjw2yybS3QXcqbeTTBx0Bew+WDMkc7CJvPfY4tAoFjxyD
         Sxdddg5YRzqzkJ0GugX+vdKzOsXh/jBaA6W4yBq+KPddwzFqG7UjkPMqFLBmCctyk6
         KKC+rdKN+1SOAopRU/8ws8IjrkRdlYTsnfYkd44wbi/BHEuLZttKoN6fkaMfQZCjqW
         jcNvu/SD/g/lw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MsHru-1qbRPH3d9O-00tmK5 for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023
 12:54:01 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils/stable-1.24 v1] ChangeLog: fix release 1.24.1 typo
Date:   Thu, 30 Mar 2023 12:54:01 +0200
Message-Id: <20230330105401.25437-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:2Fxjugn/cQ1z3gymoEpuQvX/EbGfVwFfyjOujMgBD7bfaX7/G0a
 kaMPtXSszGprTUYlhuvkYEdN/bLX6BrRct0riAAfW6G9TxpyUC7xrI7CGy5/AbM0AzbYUOF
 n6C3VhyNdTyCdT2ksOWR4lva7SJzOnJQRojUYL2DddQ983YAB+6Yyt/UC4RkzD9BsiA31Hb
 5uRPSYBt2b88rOYjSSxIg==
UI-OutboundReport: notjunk:1;M01:P0:fHgPHUBhDOo=;FGYDpJpvclOgPyWD8HPD5AXEGLM
 EieeBDEmrs8Icpkgib3LVBEIL61e0Iona8wXI/pBiDy0KUQ4ZQVMtiI5vXB2Kqu7F5mslC99P
 gUIUBPy7NTk8ABBnrk+Yh9D4oTMxFDG941calsY1TP1oGRAC7DKRO4VL5ntfbR99mYpqhrRNM
 +lYCSVUrlxZjRhkF80dxc99PLlDak1sFRnCwGmiOw8CSoimK+sXzycl+yXqrQqY+hbxFDw/B1
 c/Z82tl9HQLaa5Um9jXvDN4BxKqHrsTNCldQBM+vZGiKswJHOIfjWDdbxXPHwtNxch5NrNQxc
 Zo7e8mywi3gHlYfKIImO3ayf8aZcPxQKxj8sS7iw2Fjx4t8LjZNTDTn+ICDlp5f0AUZxmy+5h
 NsIuPDuQnmqc+1UdiDyQ7bm4k37Jcd2QxxDE3I2h6zbDmU8McQ4fudtpNS0lrowfkxe3rfryy
 5vwwCxQjS7b5vjWAjdKZAWwt4U+e2Jy4E2eshuRxidiYVLcB7FuuCj+kDnQ+AzEGXNAScoflW
 PjrqKaJMcr85cVnq8eeCQtcDbYFJZe3SyeWjU4HcdkZtGXrLHcK/Lyoj8Y0XowQNv8bliW1zP
 e4huniC/QHxa+/1pscdFxd+y5Ab+Ge1i1akgU2bDubMMFDaLS9YmljaKOy6U/g9WTH9NUaQgy
 a8kudc/i0BB8kLuq8mXmpevP7TQ0Z4D6qdU7GjvhVnbeRF8eFd6KUealkRngRG3D459H+QyB6
 uyBZhmnWjaYs86sv3QChpUkGLcxgIYNNgLfyz60Geus+fF8i6EfjSoxOAhEYyejM7BRKPbC4M
 /eUsgFPWI2G5u5TwCRhup5mi1ndHlEVYf5+R0wxzec/8zTKn2Vfzflhp0jdoP1pEXik1UBWQ7
 yamneGbxdKzsSuD3LT4F6Ad5c7DBATlNNt/p4tGmcnM/AaS+XRMBhWti/zZuubDiMkN5IH4J7
 q88JusTXl4KmzyFuqqYnk6lTcpY=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

U2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KIENo
YW5nZUxvZyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL0NoYW5nZUxvZyBiL0NoYW5nZUxvZwppbmRleCBlZjdmNTI4Yy4u
YzgzZmZmNzkgMTAwNjQ0Ci0tLSBhL0NoYW5nZUxvZworKysgYi9DaGFuZ2VMb2cKQEAgLTEsNCAr
MSw0IEBACi12NGwtdXRpbHMtMS4yNC4wCit2NGwtdXRpbHMtMS4yNC4xCiAtLS0tLS0tLS0tLS0t
LS0tCiAKIEhhbnMgVmVya3VpbCAoMSk6Ci0tIAoyLjQwLjAKCg==
