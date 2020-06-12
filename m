Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A445B1F74C3
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 09:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgFLHos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 03:44:48 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:28120 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgFLHor (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 03:44:47 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200612074444epoutp03421af7533a432661b83a349732b0fe03~XvCqZZjVM0135701357epoutp03M
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 07:44:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200612074444epoutp03421af7533a432661b83a349732b0fe03~XvCqZZjVM0135701357epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1591947884;
        bh=m5J+ghZMJqGOXBmy3eWSpEpm7qa5DnNLLLRwQ72pHow=;
        h=From:To:Cc:Subject:Date:References:From;
        b=htc1f40rAWw6FXiS+4M4I8qtwkVz8AQhZSHp+IPsTDvG5DqCSakb/pRWRFhG1Vhfh
         myl3g5Y4vhJAWzyVvs7/cFQ4HBCJKr9XYQiEqWKpc2nnTx+XlT5tqahusXeFMR8xbl
         Z7rPSeFXeWCVbAPCZBNlryyN5iuOpZAPrW8SxDNQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20200612074444epcas2p2a8799ff0e6b61ad7954ecf8eeddff60f~XvCqBfvhd3212532125epcas2p29;
        Fri, 12 Jun 2020 07:44:44 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.183]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 49jt6K4YtXzMqYls; Fri, 12 Jun
        2020 07:44:41 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        87.55.19322.56233EE5; Fri, 12 Jun 2020 16:44:37 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20200612074436epcas2p33831d7a3781be5f5414152d42bfabcf0~XvCjHOlYv1960119601epcas2p3R;
        Fri, 12 Jun 2020 07:44:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200612074436epsmtrp2598ff0281ec87578f71b81888e5722af~XvCjGi_920955809558epsmtrp2X;
        Fri, 12 Jun 2020 07:44:36 +0000 (GMT)
X-AuditID: b6c32a45-7adff70000004b7a-b0-5ee332651ccf
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        84.E9.08382.46233EE5; Fri, 12 Jun 2020 16:44:36 +0900 (KST)
Received: from Dabang.dsn.sec.samsung.com (unknown [12.36.155.59]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200612074436epsmtip1b6169d2b81ae16ece444c69bf5945a97~XvCi7YhzQ1669816698epsmtip1F;
        Fri, 12 Jun 2020 07:44:36 +0000 (GMT)
From:   Hyesoo Yu <hyesoo.yu@samsung.com>
Cc:     Hyesoo Yu <hyesoo.yu@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: support to walk the list of dmabuf for debug
Date:   Fri, 12 Jun 2020 17:02:02 +0900
Message-Id: <20200612080204.19779-1-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBKsWRmVeSWpSXmKPExsWy7bCmuW6q0eM4g7YuNosrX9+zWfztvMBq
        8eXKQyaLy7vmsFn0bNjKanHq7md2BzaPO9f2sHnc7z7O5HH732Nmj74tqxg9Pm+SC2CNyrHJ
        SE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMAbpASaEsMacU
        KBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgaFigV5yYW1yal66XnJ9rZWhgYGQKVJmQk7Fh
        yk7GgheCFXPmZjUwPuLrYuTkkBAwkbh/4i9jFyMXh5DADkaJzbf6GUESQgKfGCVmL02ASHxj
        lGhYf58ZpuPu9MPsEIm9QB1LLkC1f2eU2Hb3LTtIFZuAusSJLcvARokIsEis/P6dBaSIWeA8
        o8S7q7OAEhwcwgJuEqtazUBMFgFVieMbOUHKeQWsJBY9388OsUxeYuLsu4wQcUGJkzOfsIDY
        zEDx5q2zmUFGSgicYpeYtHsCO8gcCQEXieY9LBC9whKvjm+BmiMl8fndXjYIu1zibMsjVoje
        FkaJi9OuQiWMJWY9awc7jVlAU2L9Ln2IkcoSR25BreWT6Dj8F2oTr0RHmxBEo7LE/mXzoLZK
        Sjxa284KYXtIbPq/iQUSnrESO+4/YJ/AKD8LyTOzkDwzC2HvAkbmVYxiqQXFuempxUYFhsgx
        uokRnAS1XHcwTn77Qe8QIxMH4yFGCQ5mJRFeQfGHcUK8KYmVValF+fFFpTmpxYcYTYGhO5FZ
        SjQ5H5iG80riDU2NzMwMLE0tTM2MLJTEeXMVL8QJCaQnlqRmp6YWpBbB9DFxcEo1MHUFzZsv
        +Mxmh+b1D9s3P2V91VN0PaxT2/Hzmdm/wt7pSv/azrmy+gKbzjTnJu+Jixd01/lOFH9/4fSx
        UwKzmPzybA1rLa4u1GL9bKR0JuyosSLLHL2rZdvXy8/kfGGSeSW8zErzetfS9jNnd+91dxIp
        j1ofVuBolC7Z5/gydI9lDH8bVxmTWw5vzpVGgbA+D0PTuPrpNkE7ROUOxgRJvTP5HCUVts60
        e+aCxd4XChMkbWqT56T+XjAtad/H8w+PvF5dJb1ytmTZkpQ1r0+yntv947TjYeNo/efrZATO
        ORjorrzUPtdQd8b5SN1ao/bHsv7vt8lZ/nm1+vjtWbqN3/fFxWXMvvFh0XUeszZ5fyWW4oxE
        Qy3mouJEANQ2pUgLBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGLMWRmVeSWpSXmKPExsWy7bCSnG6K0eM4g9nNChZXvr5ns/jbeYHV
        4suVh0wWl3fNYbPo2bCV1eLU3c/sDmwed67tYfO4332cyeP2v8fMHn1bVjF6fN4kF8AaxWWT
        kpqTWZZapG+XwJWxYcpOxoIXghVz5mY1MD7i62Lk5JAQMJG4O/0wexcjF4eQwG5Gic/bvrFB
        JCQlZn0+yQRhC0vcbznCCmILCXxllOi9bgJiswmoS5zYsowRxBYRYJFY+f07C4jNLHCZUeL4
        tdIuRg4OYQE3iVWtZiAmi4CqxPGNnCAVvAJWEoue72eHmC4vMXH2XUaIuKDEyZlPoKbISzRv
        nc08gZFvFpLULCSpBYxMqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgoNSS3MH4/ZV
        H/QOMTJxMB5ilOBgVhLhFRR/GCfEm5JYWZValB9fVJqTWnyIUZqDRUmc90bhwjghgfTEktTs
        1NSC1CKYLBMHp1QDU5vHO9FWm1/LVVVbNyh+TXjp6NpQeMng18VDu/plp3yd6sYrvUMytJnR
        ymr74yl3XnnpbW6/7zzXYdZNi60if1vvzEvQm1Z/ouuL+LEDl19e6U+8mhGZpy7rcvepvOOE
        nuVZ751OXXjylOuP29HvqhYSha0t1hH/tN47JR+c8M/tsl3PLr333VXhm+8eE3i/+pvq8d0v
        2w3DSiTlz9/OlvM8ttdPd0mH7OY9Rl21U+qPX53MuT9nn5tj6oO4DZvC5/24tNv7jdav9vxD
        Nyd8nMXzlmlduM3C/DcPuEK/umy/8mC20mmZwFfXXCqeTjph8HPS7ICK9bZVC89kv/15wu3E
        5a8dj3Nj1noxO72VEctQYinOSDTUYi4qTgQAXTYmH7kCAAA=
X-CMS-MailID: 20200612074436epcas2p33831d7a3781be5f5414152d42bfabcf0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200612074436epcas2p33831d7a3781be5f5414152d42bfabcf0
References: <CGME20200612074436epcas2p33831d7a3781be5f5414152d42bfabcf0@epcas2p3.samsung.com>
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's support debugging function to show exporter
detail information. The exporter don't need to manage
the lists for debugging because all dmabuf list are
managed on dmabuf framework.

That supports to walk the dmabuf list and show the
detailed information for exporter by passed function
implemented from exporter.

That helps to show exporter detail information.
For example, ION may show the buffer flag, heap name,
or the name of process to request allocation.

Change-Id: I670f04dda4a0870081e1b0fd96b9185b48b9dd15
Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
---
 drivers/dma-buf/dma-buf.c | 30 ++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 01ce125f8e8d..002bd3ac636e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1254,6 +1254,36 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
 }
 EXPORT_SYMBOL_GPL(dma_buf_vunmap);
 
+int dma_buf_exp_show(struct seq_file *s,
+		     int (*it)(struct seq_file *s, struct dma_buf *dmabuf))
+{
+	int ret;
+	struct dma_buf *buf_obj;
+
+	ret = mutex_lock_interruptible(&db_list.lock);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(buf_obj, &db_list.head, list_node) {
+		ret = mutex_lock_interruptible(&buf_obj->lock);
+		if (ret) {
+			seq_puts(s,
+				 "\tERROR locking buffer object: skipping\n");
+			continue;
+		}
+
+		ret = it(s, buf_obj);
+		mutex_unlock(&buf_obj->lock);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&db_list.lock);
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(dma_buf_exp_show);
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index ab0c156abee6..b5c0a10b4eb3 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -502,4 +502,6 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 void *dma_buf_vmap(struct dma_buf *);
 void dma_buf_vunmap(struct dma_buf *, void *vaddr);
+int dma_buf_exp_show(struct seq_file *s,
+		     int (*it)(struct seq_file *s, struct dma_buf *dmabuf));
 #endif /* __DMA_BUF_H__ */
-- 
2.27.0

