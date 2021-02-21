Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D99532093C
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 09:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhBUIvt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 03:51:49 -0500
Received: from sonic306-35.consmr.mail.bf2.yahoo.com ([74.6.132.234]:40241
        "EHLO sonic306-35.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229605AbhBUIvk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 03:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1613897454; bh=R0T/e4mnvaCnf6/8Cf6z3THKXIYG9nDcC4XQ/9LXzEU=; h=Date:From:Reply-To:Subject:References:From:Subject:Reply-To; b=jwdV2gPkQmLeT4qBpezHk+Wpp8eqeXttSFvON8LAHn77XR9SqbhyiA3IYBzTmOBPpQ2aV+5kAQCAKtoKWAJMJNHSI5foFaA7w70pOly/L3NgGRxA1RkUc9aK6ctPDMB6BDwfLwF7cVUPGfRYWos87xB5EeOpI+YwoNWWs98T61wC3CkzZ3HxSCa8G8iYDlPcS3FZM3WzjqOBzi09lsCcEgmpxv5QuM8mREr2rr8akISU7eYZujOw6LoPWtRZibKCK+AVhsff8wcoTx469BPEpnL1DaX5Q2EWiG/kx23I0vLbUUZ63aPkI0goa1sa1mJHK+QUGW/vAr6BVInG77ZdQQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1613897454; bh=qZO9UkkzVuIGQH1jXmQBbS50ZriodVx+dt2QCPSAbKx=; h=X-Sonic-MF:Date:From:Subject:From:Subject; b=R5bVajR7UDPfB8eA3mUrxZXm41xuNO7qnG3Q1F84TeTPfTUMx0DaMekzP20QmRv7NUu4L29NWBuRdfnSvc0bfMlKf/Ryd6nSVZHWg0uOrorMCZHb0clMOTLiGDKBnFFfUj2jN9/bYhHLQzpE+G+cvbjMD+cK7SYR3e6cb52S6IjrM3zsZelsYMuOyDVqXoETqlRmlHHy3z2OKMC1904AMp+wiUOswtGBe5kGfy3zHHgz3lOaZQnHsLJMJtB4oYiWSZyC88/CTVrMc3gfcIwlO8SkoImtgyCgPEzDoNqt0xG+l5b2wGdQ2vzBCxq3nY6eI3nRAQca7GSVE9fnnnfCBg==
X-YMail-OSG: BmfftpgVM1k.jBwhEu0j8HVcvO0DggrLwLSZnNO6LGmFmEr49nYL.nT5eojQlVx
 kJJ5o8B5vfYHtmNpOTa9TUHwqaPxhB6GIDwZrwOw1XsoIkxctmn0SJWCepVfsJlF9lmJoLPX6eH0
 uTUO4V6mpCrb4GpAWTMlVk9ba9sF3rkLv5RsAQhjpwJxvCF7XW1ZV9SiRAmQWcpTMewQeEbcnhhj
 JtJ.ROfZwwWwK6ooTwT5xzvZVnsdIddFU8_1bgD3EWeIKuhWpnUpHGLQtMb468ELlHCrt95M5qaj
 rrQesE1VrXylxcv50gMV9Un4eTA0pCP1TQQhsKUEenZ003SXXpHkzvMl0iPrhBtXkufIHzwIXbAq
 FDr6sFYciPyyS3FV3MNiFqHzu7FiA.37rw_LHedjpwf1XQj9FhzM24jcIA0_eD2Oz9gcVGI5vluy
 szgQN9_w76yCqqhmIUL3SoIVxkc3jcrdVWLZ3afr__1A9GuDqW_CUPjWHFAGzVw3n7jARdL14MBX
 L1EqCQ8ryLNvXlJuviy74aHi0MyFdAHL.gJaBdp5i8jlc4MdHP4guNnTFlhwfw7XU4wGCAwl8rI5
 4TahKneigj14QxvzZI4xhD6bHWsAadu1XL5sQM3repCOSzSNOrCOMnrIc7Ci07exqtj8F1w6Uzbx
 THwxDNil.YC7vf5TIIZ9BNv_7sajAGZKlKxnUi_Ri.X927Uuechd6FEMe33DdSDOwAdv62bwRY_t
 3HWoMhsLs5g8msm5oiEiowGJp9HOubk4tiNZiRl65WAH_Qz42Ln.FKyTpW4VCRMHz8NAy5e.zeMw
 QLCcrUinqwgY0AGJMJnuIRyNZhuVCUjtJlTn5NKa8hxitnoG0LsSiBbKDeWMwtyUxQktdOmZU39z
 T7SQ5OTEDFKJ.O6UjaZ72hu7PaQJlk6LkVv3H3XqdfrtAY63MJ.Wj3Oe_xSza5Yxe_XF.MDo8RhZ
 mUg9OFQbYL2TIEO2jKWG2mCjWdd7bH5QUPCzPD_wHNJhT0aJGlx0l.bI_TOczvb87tjcYcXRyUUF
 Cr5fbZxLAs.2fZQxEgMU5mDoUxiB6wq8GoazbHOkcUps2SWNlsXfTv7h9FxXDGTDEwyzXWA5n3Fh
 nxfR_KzvPzKREmH63B7couBxL_lza9BDkWMPGYVjnTi1qVyVsfMfGwbbHDKTYPd4rsEE7PFR5.qh
 vbAnagzacYBM80AocWDVQxgPjAtZUW76d2YLWPsWhZXs4zgbo8cOaOPgqDQ0ZqzyDxDCyLkmDqtJ
 T2w_7W9YKfQcs.sJLiR5TCgWpktw8UKF2R_5roAJ.vcquer39uiaJV7rDKTj.ZnOTNk3BNBR6zkV
 DGgV5KpXaBX5_iPh9RPMyE01HM3O1SZ29USMA4VJkbqTLEQHm8C86OrZJt.faAD7oz4LUMutwmV1
 EZ53QoU87RwN27hgWfHDVh9ctGuDsyLVNuGfoq4TQ9Sdmnr54afwza6jsRUsjnLVAk9XzB6B7sUC
 1.RyMaKK1DF_HZRN2J2UKlVlW6vhHYEV0bPopouOGHChat1S_w.zIrrYXvasTmjJjbiuxRR02cga
 x3x542uGSk_0_V.Vj.t_AWBfaoGDptqbopXcZEXYsaoDyDLcvhfN9.3NQOKuqfU_ULljGs8GoDNU
 GDN4A8dlcGAhmSgGEedDEgpJKYyEpUl6ga9qGER92bV1shARolqvC5HG4eJqjcVwd2CwnctPLLGz
 yfxwYIELmuYI3gzqHVklGwpNUAgxeIhT.yr1H.pzcUV7AAiuR.Wkd1fqROUcA0vZ7a2z_HsDwMwg
 YFVly9NJzXSnH.G6C_hTgi3jNdPjarCYhFlzeZT.2Xi51rCKqvDbAszQOcoJarDl3mLxi03UgWaf
 FFvUrYXGSEo3deMtQmtlK6ItMJzPZuyo1rZEsslhfA8LmPbYHlCfrVcEe.KBWNDkOiDoqyZWof.V
 DHdVx1iWl2X_xa2QS0eo5Oiak6S.FvnKt03oRCA.fuYzfHyZFk_RobzE6VksdnXcY0ex_20zrg7c
 e3YWKzSuA5pxdlrZ2ovzq1aa5xUKGQHGjQfs.kLICeNQtX7SBLDHIMOLz4VMIoR5DlzgCiMezB6h
 Jn778.jTxmcLyd1Xtc8aD4KtlMs1FkeBKU22nQF6As70JJYFg.7ev691VcDWnGQXDqzyanfWs47i
 _okOH2acUmJ65JhMzRE_5fmFJrQ7AYRZSGLjmReoN7J2mig3grgCCw2FxD2uBxB4LcFRAXLSrQF5
 nye2vALX7Fc7K9JVX8i3RDtVqmSvSq.BIV3tVnrXaNsPrQ7fi38oeOeMWQMKcCwMDJsn.vqT74.e
 ewzleBoEIckVhV0b6_DbHpEbFiyGI9jt5sozt03_aNSPesMSfBZWOfxBSMZnssPwooeiVDgeWgbe
 S5KzTX7KiViMBlMhoNOmoHIV8mhlyzYgPmBcNQlu_klQXOrQU2Wfb.sDl64sSv8l62rGnkSmyAhA
 LCb1wNuDVhjWNkDNDU5dYIWvWPzr8s.jxuc38kjK7gqgHXKLdBcagdjZqVC4uRe7HuIG5nzoHsa8
 DjXrLyXL7JWxX.8dynrjMVbJLxXSAZ_SH.3D90oO4nIFtMgtY3SRsnnm3SiAeinAm2gk3gApYmw6
 3pDgUckySDF7cjqVoDsE.92GJcyuDkMJGozWJ7qOuzzqisZOnJQ0X6cnjRD7Xn6WqhortYVO66XN
 7VvajaTb6sTzHlt6L3qZopKxWg03vxRS82pEB7wfdLAx7TmlCINtQA_LhIN0Rh_fCXGjr_ev6TT9
 tVHnC1DRam5aTpdDDh87n_bIS11GVX0GLzRCv0TO_9Ntgf6JwmDvANfjtUv_Qz0dp5AvXFprGKnZ
 NE1gFCs77L4Cg_OPerkb90YWcOx_968YnCstLDiQWA.5zlKBHhwT45mPqDtkudY4440hwufDedQZ
 L.JAbWK9_Ars66MW9XySsXDJqhICU6FVkSA5rVcr5MD6mrPPrTqFZlfFCQCo2TTePLZSZc0xlnX.
 w9KN7uI0wCGfXcKRistbWrpX7REc7pFf1NkitLhkWSkhWbQWyO5TRR4qxBqr3T5abZBzb.MFWu0N
 kEcQ5nd3YPl7Xikj.pXVLK1TYg7N8i0Xn3Ivflm65MmKDFtO0MrcOqao4iOElkp8ERBGaa.xqG1j
 TbDcmfGir6FppXcyMrc.x_sG1c_H17SBQ.NX8AbTx7QxN8qqyYIFSbrniXEqz3CxkgCIV2r6CSQh
 4TS9Ura13tNNfxqf4xJlsNoT7ylnr_bha6vcTwr2QVKM2QJFxggNTV0HdLt1KbQTtqLvTnMsNTee
 rWONsxsDC_xo4iUx9JdIxM8W6bfuD.1HV8xEIbHWbXdQaYDyDFsAkNVot64jVUHkJNwELIAqUGEH
 tY_gnqqJdcJxQnkvF0dZpW2sXnFrMdgaxA5lfdNUtt_VZ4rjSkXXdXzgj2n24yofDIHQM0qp4apl
 KE3sSa0_KwLrBfm9dH3KL9tjj33W.NSb99V3prqjuDYV7nx74S876V.dQhrbbASvfQjpV4IXZPsF
 pL3ZGqSneVeB7aVa8KJZYiWzcdUKC4D9kkD8V_.pMzwfjwegnfISNmhNRyXbjxCDtefwTZFM7cSd
 XSfQ7M0u.b4lG_QXoNzrdRymp4Y.WU9z0U5n1V3sdqABRfqMSW8k2SiugchA3UbpcmEYuqS9.PNV
 i8Q1FXpnEjJom6x8YZe1qT0Y1N8z018yLJeL7tBgr7E96oB1gnRmL4TbYIKHGb9kLc7vX8.JTOp0
 7yQe3HhOyuUB04tjUN_jmndOzhX_BrkHGgQjtpRnpImiEbuVMSSCpKwJlhlPm3q309vE_VG8xduD
 _oA--
X-Sonic-MF: <sunny1011@utalo.in>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Sun, 21 Feb 2021 08:50:54 +0000
Date:   Sun, 21 Feb 2021 08:48:53 +0000 (UTC)
From:   COLRUYT GROUP <sunny1011@utalo.in>
Reply-To: colruyt.group1@outlook.com
Message-ID: <102358855.435082.1613897333467@mail.yahoo.com>
Subject: Inquiry
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <102358855.435082.1613897333467.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.17712 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org





Dear Sir/Madam

I am Mathijs De Klerk, Purchasing Manager
for COLRUYT GROUP. we are interested to
know more about your products, prizes and
shipping procedure as soon as possible.

Looking forward to your response.

Best Regards

Mathijs De Klerk
Purchasing Manager
COLRUYT GROUP
Edingensesteenweg 196
1500 Halle
Belgium.+32(0)2-394-5545
www.colruytgroup.com
