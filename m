Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961F99E874
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 14:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbfH0Mzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 08:55:37 -0400
Received: from gofer.mess.org ([88.97.38.141]:52263 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729803AbfH0Mzh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 08:55:37 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A77BF60667; Tue, 27 Aug 2019 13:55:35 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils 2/2] toml: update to tomlc99 commit f12c8f00b457defaae1495773d76dfb9ff1bf4c8
Date:   Tue, 27 Aug 2019 13:55:35 +0100
Message-Id: <20190827125535.2858-2-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190827125535.2858-1-sean@mess.org>
References: <20190827125535.2858-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The toml reader has a a slew of updates. Sync.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/toml.c | 1584 +++++++++++++++++++++++--------------------
 utils/common/toml.h |   50 +-
 2 files changed, 892 insertions(+), 742 deletions(-)

diff --git a/utils/common/toml.c b/utils/common/toml.c
index e4b57190..2a9f3dac 100644
--- a/utils/common/toml.c
+++ b/utils/common/toml.c
@@ -1,7 +1,7 @@
 /*
 MIT License
 
-Copyright (c) 2017 CK Tan 
+Copyright (c) 2017 - 2019 CK Tan 
 https://github.com/cktan/tomlc99
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
@@ -39,8 +39,8 @@ char* strndup(const char* s, size_t n)
     size_t len = strnlen(s, n);
     char* p = malloc(len+1);
     if (p) {
-	memcpy(p, s, len);
-	p[len] = 0;
+        memcpy(p, s, len);
+        p[len] = 0;
     }
     return p;
 }
@@ -61,76 +61,78 @@ int toml_utf8_to_ucs(const char* orig, int len, int64_t* ret)
        0xxxxxxx
     */
     if (0 == (i >> 7)) {
-	if (len < 1) return -1;
-	v = i;
-	return *ret = v, 1;
+        if (len < 1) return -1;
+        v = i;
+        return *ret = v, 1;
     }
     /* 0x00000080 - 0x000007FF:
        110xxxxx 10xxxxxx
     */
     if (0x6 == (i >> 5)) {
-	if (len < 2) return -1;
-	v = i & 0x1f;
-	i = *(++buf);
-	if (0x2 != (i >> 6)) return -1;
-	v = (v << 6) | (i & 0x3f);
-	return *ret = v, (const char*) buf - orig;
+        if (len < 2) return -1;
+        v = i & 0x1f;
+        for (int j = 0; j < 1; j++) {
+            i = *buf++;
+            if (0x2 != (i >> 6)) return -1;
+            v = (v << 6) | (i & 0x3f);
+        }
+        return *ret = v, (const char*) buf - orig;
     }
 
     /* 0x00000800 - 0x0000FFFF:
        1110xxxx 10xxxxxx 10xxxxxx
     */
     if (0xE == (i >> 4)) {
-	if (len < 3) return -1;
-	v = i & 0x0F;
-	for (int j = 0; j < 2; j++) {
-	    i = *(++buf);
-	    if (0x2 != (i >> 6)) return -1;
-	    v = (v << 6) | (i & 0x3f);
-	}
-	return *ret = v, (const char*) buf - orig;
+        if (len < 3) return -1;
+        v = i & 0x0F;
+        for (int j = 0; j < 2; j++) {
+            i = *buf++;
+            if (0x2 != (i >> 6)) return -1;
+            v = (v << 6) | (i & 0x3f);
+        }
+        return *ret = v, (const char*) buf - orig;
     }
 
     /* 0x00010000 - 0x001FFFFF:
        11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
     */
     if (0x1E == (i >> 3)) {
-	if (len < 4) return -1;
-	v = i & 0x07;
-	for (int j = 0; j < 3; j++) {
-	    i = *(++buf);
-	    if (0x2 != (i >> 6)) return -1;
-	    v = (v << 6) | (i & 0x3f);
-	}
-	return *ret = v, (const char*) buf - orig;
+        if (len < 4) return -1;
+        v = i & 0x07;
+        for (int j = 0; j < 3; j++) {
+            i = *buf++;
+            if (0x2 != (i >> 6)) return -1;
+            v = (v << 6) | (i & 0x3f);
+        }
+        return *ret = v, (const char*) buf - orig;
     }
     
     /* 0x00200000 - 0x03FFFFFF:
        111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
     */
     if (0x3E == (i >> 2)) {
-	if (len < 5) return -1;
-	v = i & 0x03;
-	for (int j = 0; j < 4; j++) {
-	    i = *(++buf);
-	    if (0x2 != (i >> 6)) return -1;
-	    v = (v << 6) | (i & 0x3f);
-	}
-	return *ret = v, (const char*) buf - orig;
+        if (len < 5) return -1;
+        v = i & 0x03;
+        for (int j = 0; j < 4; j++) {
+            i = *buf++;
+            if (0x2 != (i >> 6)) return -1;
+            v = (v << 6) | (i & 0x3f);
+        }
+        return *ret = v, (const char*) buf - orig;
     }
 
     /* 0x04000000 - 0x7FFFFFFF:
        1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
     */
     if (0x7e == (i >> 1)) {
-	if (len < 6) return -1;
-	v = i & 0x01;
-	for (int j = 0; j < 5; j++) {
-	    i = *(++buf);
-	    if (0x2 != (i >> 6)) return -1;
-	    v = (v << 6) | (i & 0x3f);
-	}
-	return *ret = v, (const char*) buf - orig;
+        if (len < 6) return -1;
+        v = i & 0x01;
+        for (int j = 0; j < 5; j++) {
+            i = *buf++;
+            if (0x2 != (i >> 6)) return -1;
+            v = (v << 6) | (i & 0x3f);
+        }
+        return *ret = v, (const char*) buf - orig;
     }
     return -1;
 }
@@ -156,63 +158,63 @@ int toml_ucs_to_utf8(int64_t code, char buf[6])
     */
     if (code < 0) return -1;
     if (code <= 0x7F) {
-	buf[0] = (unsigned char) code;
-	return 1;
+        buf[0] = (unsigned char) code;
+        return 1;
     }
 
     /* 0x00000080 - 0x000007FF:
        110xxxxx 10xxxxxx
     */
     if (code <= 0x000007FF) {
-	buf[0] = 0xc0 | (code >> 6);
-	buf[1] = 0x80 | (code & 0x3f);
-	return 2;
+        buf[0] = 0xc0 | (code >> 6);
+        buf[1] = 0x80 | (code & 0x3f);
+        return 2;
     }
 
     /* 0x00000800 - 0x0000FFFF:
        1110xxxx 10xxxxxx 10xxxxxx
     */
     if (code <= 0x0000FFFF) {
-	buf[0] = 0xe0 | (code >> 12);
-	buf[1] = 0x80 | ((code >> 6) & 0x3f);
-	buf[2] = 0x80 | (code & 0x3f);
-	return 3;
+        buf[0] = 0xe0 | (code >> 12);
+        buf[1] = 0x80 | ((code >> 6) & 0x3f);
+        buf[2] = 0x80 | (code & 0x3f);
+        return 3;
     }
 
     /* 0x00010000 - 0x001FFFFF:
        11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
     */
     if (code <= 0x001FFFFF) {
-	buf[0] = 0xf0 | (code >> 18);
-	buf[1] = 0x80 | ((code >> 12) & 0x3f);
-	buf[2] = 0x80 | ((code >> 6) & 0x3f);
-	buf[3] = 0x80 | (code & 0x3f);
-	return 4;
+        buf[0] = 0xf0 | (code >> 18);
+        buf[1] = 0x80 | ((code >> 12) & 0x3f);
+        buf[2] = 0x80 | ((code >> 6) & 0x3f);
+        buf[3] = 0x80 | (code & 0x3f);
+        return 4;
     }
 
     /* 0x00200000 - 0x03FFFFFF:
        111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
     */
     if (code <= 0x03FFFFFF) {
-	buf[0] = 0xf8 | (code >> 24);
-	buf[1] = 0x80 | ((code >> 18) & 0x3f);
-	buf[2] = 0x80 | ((code >> 12) & 0x3f);
-	buf[3] = 0x80 | ((code >> 6) & 0x3f);
-	buf[4] = 0x80 | (code & 0x3f);
-	return 5;
+        buf[0] = 0xf8 | (code >> 24);
+        buf[1] = 0x80 | ((code >> 18) & 0x3f);
+        buf[2] = 0x80 | ((code >> 12) & 0x3f);
+        buf[3] = 0x80 | ((code >> 6) & 0x3f);
+        buf[4] = 0x80 | (code & 0x3f);
+        return 5;
     }
     
     /* 0x04000000 - 0x7FFFFFFF:
        1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
     */
     if (code <= 0x7FFFFFFF) {
-	buf[0] = 0xfc | (code >> 30);
-	buf[1] = 0x80 | ((code >> 24) & 0x3f);
-	buf[2] = 0x80 | ((code >> 18) & 0x3f);
-	buf[3] = 0x80 | ((code >> 12) & 0x3f);
-	buf[4] = 0x80 | ((code >> 6) & 0x3f);
-	buf[5] = 0x80 | (code & 0x3f);
-	return 6;
+        buf[0] = 0xfc | (code >> 30);
+        buf[1] = 0x80 | ((code >> 24) & 0x3f);
+        buf[2] = 0x80 | ((code >> 18) & 0x3f);
+        buf[3] = 0x80 | ((code >> 12) & 0x3f);
+        buf[4] = 0x80 | ((code >> 6) & 0x3f);
+        buf[5] = 0x80 | (code & 0x3f);
+        return 6;
     }
 
     return -1;
@@ -224,28 +226,28 @@ int toml_ucs_to_utf8(int64_t code, char buf[6])
  */
 typedef struct toml_keyval_t toml_keyval_t;
 struct toml_keyval_t {
-    const char* key;		/* key to this value */
-    const char* val;		/* the raw value */
+    const char* key;            /* key to this value */
+    const char* val;            /* the raw value */
 };
 
 
 struct toml_array_t {
-    const char* key;		/* key to this array */
+    const char* key;            /* key to this array */
     int kind; /* element kind: 'v'alue, 'a'rray, or 't'able */
     int type; /* for value kind: 'i'nt, 'd'ouble, 'b'ool, 's'tring, 't'ime, 'D'ate, 'T'imestamp */
     
-    int nelem;			/* number of elements */
+    int nelem;                  /* number of elements */
     union {
-	char** val;
-	toml_array_t** arr;
-	toml_table_t** tab;
+        char** val;
+        toml_array_t** arr;
+        toml_table_t** tab;
     } u;
 };
     
 
 struct toml_table_t {
-    const char* key;		/* key to this table */
-    int implicit;		/* table was created implicitly */
+    const char* key;            /* key to this table */
+    int implicit;               /* table was created implicitly */
 
     /* key-values in the table */
     int             nkval;
@@ -282,7 +284,7 @@ typedef struct token_t token_t;
 struct token_t {
     tokentype_t tok;
     int         lineno;
-    char*       ptr;
+    char*       ptr;            /* points into context->start */
     int         len;
     int         eof;
 };
@@ -301,9 +303,9 @@ struct context_t {
     toml_table_t* curtab;
 
     struct {
-	int     top;
-	char*   key[10];
-	token_t tok[10];
+        int     top;
+        char*   key[10];
+        token_t tok[10];
     } tpath;
 
 };
@@ -358,12 +360,12 @@ static int e_key_exists_error(context_t* ctx, token_t keytok)
     char buf[100];
     int i;
     for (i = 0; i < keytok.len && i < (int)sizeof(buf) - 1; i++) {
-	buf[i] = keytok.ptr[i];
+        buf[i] = keytok.ptr[i];
     }
     buf[i] = 0;
 
     snprintf(ctx->errbuf, ctx->errbufsz,
-	     "line %d: key %s exists", keytok.lineno, buf);
+             "line %d: key %s exists", keytok.lineno, buf);
     longjmp(ctx->jmp, 1);
     return -1;
 }
@@ -375,103 +377,103 @@ static int e_key_exists_error(context_t* ctx, token_t keytok)
  * Returns NULL if error with errmsg in errbuf.
  */
 static char* normalize_string(const char* src, int srclen,
-			      int kill_line_ending_backslash,
-			      char* errbuf, int errbufsz)
+                              int kill_line_ending_backslash,
+                              char* errbuf, int errbufsz)
 {
-    char* dst = 0;		/* will write to dst[] and return it */
-    int   max = 0;		/* max size of dst[] */
-    int   off = 0;		/* cur offset in dst[] */
+    char* dst = 0;              /* will write to dst[] and return it */
+    int   max = 0;              /* max size of dst[] */
+    int   off = 0;              /* cur offset in dst[] */
     const char* sp = src;
     const char* sq = src + srclen;
     int ch;
 
     /* scan forward on src */
     for (;;) {
-	if (off >=  max - 10) { /* have some slack for misc stuff */
-	    char* x = realloc(dst, max += 100);
-	    if (!x) {
-		xfree(dst);
-		snprintf(errbuf, errbufsz, "out of memory");
-		return 0;
-	    }
-	    dst = x;
-	}
-	
-	/* finished? */
-	if (sp >= sq) break; 
-	
-	ch = *sp++;
-	if (ch != '\\') {
-	    // a plain copy suffice
-	    dst[off++] = ch;
-	    continue;
-	}
+        if (off >=  max - 10) { /* have some slack for misc stuff */
+            char* x = realloc(dst, max += 100);
+            if (!x) {
+                xfree(dst);
+                snprintf(errbuf, errbufsz, "out of memory");
+                return 0;
+            }
+            dst = x;
+        }
+        
+        /* finished? */
+        if (sp >= sq) break; 
+        
+        ch = *sp++;
+        if (ch != '\\') {
+            // a plain copy suffice
+            dst[off++] = ch;
+            continue;
+        }
 
-	/* ch was backslash. we expect the escape char. */
-	if (sp >= sq) {
-	    snprintf(errbuf, errbufsz, "last backslash is invalid");
-	    free(dst);
-	    return 0;
-	}
+        /* ch was backslash. we expect the escape char. */
+        if (sp >= sq) {
+            snprintf(errbuf, errbufsz, "last backslash is invalid");
+            free(dst);
+            return 0;
+        }
 
-	/* if we want to kill line-ending-backslash ... */
-	if (kill_line_ending_backslash) {
-	    /* if this is a newline immediately following the backslash ... */
-	    if (*sp == '\n' || (*sp == '\r' && sp[1] == '\n')) {
-		/* skip all the following whitespaces */
-		sp += strspn(sp, " \t\r\n");
-		continue;
-	    }
-	}
+        /* if we want to kill line-ending-backslash ... */
+        if (kill_line_ending_backslash) {
+            /* if this is a newline immediately following the backslash ... */
+            if (*sp == '\n' || (*sp == '\r' && sp[1] == '\n')) {
+                /* skip all the following whitespaces */
+                sp += strspn(sp, " \t\r\n");
+                continue;
+            }
+        }
 
-	/* get the escaped char */
-	ch = *sp++;
-	switch (ch) {
-	case 'u': case 'U':
-	    {
-		int64_t ucs = 0;
-		int nhex = (ch == 'u' ? 4 : 8);
-		for (int i = 0; i < nhex; i++) {
-		    if (sp >= sq) {
-			snprintf(errbuf, errbufsz, "\\%c expects %d hex chars", ch, nhex);
-			free(dst);
-			return 0;
-		    }
-		    ch = *sp++;
-		    int v = ('0' <= ch && ch <= '9')
-			? ch - '0'
-			: (('A' <= ch && ch <= 'F') ? ch - 'A' + 10 : -1);
-		    if (-1 == v) {
-			snprintf(errbuf, errbufsz, "invalid hex chars for \\u or \\U");
-			free(dst);
-			return 0;
-		    }
-		    ucs = ucs * 16 + v;
-		}
-		int n = toml_ucs_to_utf8(ucs, &dst[off]);
-		if (-1 == n) {
-		    snprintf(errbuf, errbufsz, "illegal ucs code in \\u or \\U");
-		    free(dst);
-		    return 0;
-		}
-		off += n;
-	    }
-	    continue;
-
-	case 'b': ch = '\b'; break;
-	case 't': ch = '\t'; break;
-	case 'n': ch = '\n'; break;
-	case 'f': ch = '\f'; break;
-	case 'r': ch = '\r'; break;
-	case '"':  ch = '"'; break;
-	case '\\': ch = '\\'; break;
-	default: 
-	    snprintf(errbuf, errbufsz, "illegal escape char \\%c", ch);
-	    free(dst);
-	    return 0;
-	}
+        /* get the escaped char */
+        ch = *sp++;
+        switch (ch) {
+        case 'u': case 'U':
+            {
+                int64_t ucs = 0;
+                int nhex = (ch == 'u' ? 4 : 8);
+                for (int i = 0; i < nhex; i++) {
+                    if (sp >= sq) {
+                        snprintf(errbuf, errbufsz, "\\%c expects %d hex chars", ch, nhex);
+                        free(dst);
+                        return 0;
+                    }
+                    ch = *sp++;
+                    int v = ('0' <= ch && ch <= '9')
+                        ? ch - '0'
+                        : (('A' <= ch && ch <= 'F') ? ch - 'A' + 10 : -1);
+                    if (-1 == v) {
+                        snprintf(errbuf, errbufsz, "invalid hex chars for \\u or \\U");
+                        free(dst);
+                        return 0;
+                    }
+                    ucs = ucs * 16 + v;
+                }
+                int n = toml_ucs_to_utf8(ucs, &dst[off]);
+                if (-1 == n) {
+                    snprintf(errbuf, errbufsz, "illegal ucs code in \\u or \\U");
+                    free(dst);
+                    return 0;
+                }
+                off += n;
+            }
+            continue;
+
+        case 'b': ch = '\b'; break;
+        case 't': ch = '\t'; break;
+        case 'n': ch = '\n'; break;
+        case 'f': ch = '\f'; break;
+        case 'r': ch = '\r'; break;
+        case '"':  ch = '"'; break;
+        case '\\': ch = '\\'; break;
+        default: 
+            snprintf(errbuf, errbufsz, "illegal escape char \\%c", ch);
+            free(dst);
+            return 0;
+        }
 
-	dst[off++] = ch;
+        dst[off++] = ch;
     }
 
     // Cap with NUL and return it.
@@ -492,43 +494,43 @@ static char* normalize_key(context_t* ctx, token_t strtok)
 
     /* handle quoted string */
     if (ch == '\'' || ch == '\"') {
-	/* if ''' or """, take 3 chars off front and back. Else, take 1 char off. */
-	if (sp[1] == ch && sp[2] == ch) 
-	    sp += 3, sq -= 3;
-	else
-	    sp++, sq--;
-
-	if (ch == '\'') {
-	    /* for single quote, take it verbatim. */
-	    if (! (ret = strndup(sp, sq - sp))) {
+        /* if ''' or """, take 3 chars off front and back. Else, take 1 char off. */
+        if (sp[1] == ch && sp[2] == ch) 
+            sp += 3, sq -= 3;
+        else
+            sp++, sq--;
+
+        if (ch == '\'') {
+            /* for single quote, take it verbatim. */
+            if (! (ret = strndup(sp, sq - sp))) {
                 e_outofmemory(ctx, FLINE);
                 return 0;       /* not reached */
             }
-	} else {
-	    /* for double quote, we need to normalize */
-	    ret = normalize_string(sp, sq - sp, 0, ebuf, sizeof(ebuf));
-	    if (!ret) {
-		snprintf(ctx->errbuf, ctx->errbufsz, "line %d: %s", lineno, ebuf);
-		longjmp(ctx->jmp, 1);
-	    }
-	}
+        } else {
+            /* for double quote, we need to normalize */
+            ret = normalize_string(sp, sq - sp, 0, ebuf, sizeof(ebuf));
+            if (!ret) {
+                snprintf(ctx->errbuf, ctx->errbufsz, "line %d: %s", lineno, ebuf);
+                longjmp(ctx->jmp, 1);
+            }
+        }
 
-	/* newlines are not allowed in keys */
-	if (strchr(ret, '\n')) {
-	    free(ret);
-	    e_bad_key_error(ctx, lineno);
+        /* newlines are not allowed in keys */
+        if (strchr(ret, '\n')) {
+            free(ret);
+            e_bad_key_error(ctx, lineno);
             return 0;           /* not reached */
-	}
-	return ret;
+        }
+        return ret;
     }
-	
+        
     /* for bare-key allow only this regex: [A-Za-z0-9_-]+ */
     const char* xp;
     for (xp = sp; xp != sq; xp++) {
-	int k = *xp;
-	if (isalnum(k)) continue;
-	if (k == '_' || k == '-') continue;
-	e_bad_key_error(ctx, lineno);
+        int k = *xp;
+        if (isalnum(k)) continue;
+        if (k == '_' || k == '-') continue;
+        e_bad_key_error(ctx, lineno);
         return 0;               /* not reached */
     }
 
@@ -546,9 +548,9 @@ static char* normalize_key(context_t* ctx, token_t strtok)
  * 'v'alue, 'a'rray or 't'able depending on the element.
  */
 static int check_key(toml_table_t* tab, const char* key,
-		     toml_keyval_t** ret_val,
-		     toml_array_t** ret_arr,
-		     toml_table_t** ret_tab)
+                     toml_keyval_t** ret_val,
+                     toml_array_t** ret_arr,
+                     toml_table_t** ret_tab)
 {
     int i;
     void* dummy;
@@ -560,22 +562,22 @@ static int check_key(toml_table_t* tab, const char* key,
     *ret_tab = 0; *ret_arr = 0; *ret_val = 0;
     
     for (i = 0; i < tab->nkval; i++) {
-	if (0 == strcmp(key, tab->kval[i]->key)) {
-	    *ret_val = tab->kval[i];
-	    return 'v';
-	}
+        if (0 == strcmp(key, tab->kval[i]->key)) {
+            *ret_val = tab->kval[i];
+            return 'v';
+        }
     }
     for (i = 0; i < tab->narr; i++) {
-	if (0 == strcmp(key, tab->arr[i]->key)) {
-	    *ret_arr = tab->arr[i];
-	    return 'a';
-	}
+        if (0 == strcmp(key, tab->arr[i]->key)) {
+            *ret_arr = tab->arr[i];
+            return 'a';
+        }
     }
     for (i = 0; i < tab->ntab; i++) {
-	if (0 == strcmp(key, tab->tab[i]->key)) {
-	    *ret_tab = tab->tab[i];
-	    return 't';
-	}
+        if (0 == strcmp(key, tab->tab[i]->key)) {
+            *ret_tab = tab->tab[i];
+            return 't';
+        }
     }
     return 0;
 }
@@ -592,8 +594,8 @@ static toml_keyval_t* create_keyval_in_table(context_t* ctx, toml_table_t* tab,
     /* if key exists: error out. */
     toml_keyval_t* dest = 0;
     if (check_key(tab, newkey, 0, 0, 0)) {
-	free(newkey);
-	e_key_exists_error(ctx, keytok);
+        free(newkey);
+        e_key_exists_error(ctx, keytok);
         return 0;               /* not reached */
     }
 
@@ -601,15 +603,15 @@ static toml_keyval_t* create_keyval_in_table(context_t* ctx, toml_table_t* tab,
     int n = tab->nkval;
     toml_keyval_t** base;
     if (0 == (base = (toml_keyval_t**) realloc(tab->kval, (n+1) * sizeof(*base)))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
+        free(newkey);
+        e_outofmemory(ctx, FLINE);
         return 0;               /* not reached */
     }
     tab->kval = base;
     
     if (0 == (base[n] = (toml_keyval_t*) calloc(1, sizeof(*base[n])))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
+        free(newkey);
+        e_outofmemory(ctx, FLINE);
         return 0;               /* not reached */
     }
     dest = tab->kval[tab->nkval++];
@@ -632,15 +634,15 @@ static toml_table_t* create_keytable_in_table(context_t* ctx, toml_table_t* tab,
     /* if key exists: error out */
     toml_table_t* dest = 0;
     if (check_key(tab, newkey, 0, 0, &dest)) {
-	free(newkey);		/* don't need this anymore */
-	
-	/* special case: if table exists, but was created implicitly ... */
-	if (dest && dest->implicit) {
-	    /* we make it explicit now, and simply return it. */
-	    dest->implicit = 0;
-	    return dest;
-	}
-	e_key_exists_error(ctx, keytok);
+        free(newkey);           /* don't need this anymore */
+        
+        /* special case: if table exists, but was created implicitly ... */
+        if (dest && dest->implicit) {
+            /* we make it explicit now, and simply return it. */
+            dest->implicit = 0;
+            return dest;
+        }
+        e_key_exists_error(ctx, keytok);
         return 0;               /* not reached */
     }
 
@@ -648,15 +650,15 @@ static toml_table_t* create_keytable_in_table(context_t* ctx, toml_table_t* tab,
     int n = tab->ntab;
     toml_table_t** base;
     if (0 == (base = (toml_table_t**) realloc(tab->tab, (n+1) * sizeof(*base)))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
+        free(newkey);
+        e_outofmemory(ctx, FLINE);
         return 0;               /* not reached */
     }
     tab->tab = base;
-	
+        
     if (0 == (base[n] = (toml_table_t*) calloc(1, sizeof(*base[n])))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
+        free(newkey);
+        e_outofmemory(ctx, FLINE);
         return 0;               /* not reached */
     }
     dest = tab->tab[tab->ntab++];
@@ -670,9 +672,9 @@ static toml_table_t* create_keytable_in_table(context_t* ctx, toml_table_t* tab,
 /* Create an array in the table.
  */
 static toml_array_t* create_keyarray_in_table(context_t* ctx,
-					      toml_table_t* tab,
-					      token_t keytok,
-					      int skip_if_exist)
+                                              toml_table_t* tab,
+                                              token_t keytok,
+                                              int skip_if_exist)
 {
     /* first, normalize the key to be used for lookup. 
      * remember to free it if we error out. 
@@ -682,12 +684,12 @@ static toml_array_t* create_keyarray_in_table(context_t* ctx,
     /* if key exists: error out */
     toml_array_t* dest = 0;
     if (check_key(tab, newkey, 0, &dest, 0)) {
-	free(newkey); 		/* don't need this anymore */
+        free(newkey);           /* don't need this anymore */
 
-	/* special case skip if exists? */
-	if (skip_if_exist) return dest;
-	
-	e_key_exists_error(ctx, keytok);
+        /* special case skip if exists? */
+        if (skip_if_exist) return dest;
+        
+        e_key_exists_error(ctx, keytok);
         return 0;               /* not reached */
     }
 
@@ -695,15 +697,15 @@ static toml_array_t* create_keyarray_in_table(context_t* ctx,
     int n = tab->narr;
     toml_array_t** base;
     if (0 == (base = (toml_array_t**) realloc(tab->arr, (n+1) * sizeof(*base)))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
+        free(newkey);
+        e_outofmemory(ctx, FLINE);
         return 0;               /* not reached */
     }
     tab->arr = base;
-	
+        
     if (0 == (base[n] = (toml_array_t*) calloc(1, sizeof(*base[n])))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
+        free(newkey);
+        e_outofmemory(ctx, FLINE);
         return 0;               /* not reached */
     }
     dest = tab->arr[tab->narr++];
@@ -716,18 +718,18 @@ static toml_array_t* create_keyarray_in_table(context_t* ctx,
 /* Create an array in an array 
  */
 static toml_array_t* create_array_in_array(context_t* ctx,
-					   toml_array_t* parent)
+                                           toml_array_t* parent)
 {
     int n = parent->nelem;
     toml_array_t** base;
     if (0 == (base = (toml_array_t**) realloc(parent->u.arr, (n+1) * sizeof(*base)))) {
-	e_outofmemory(ctx, FLINE);
+        e_outofmemory(ctx, FLINE);
         return 0;               /* not reached */
     }
     parent->u.arr = base;
     
     if (0 == (base[n] = (toml_array_t*) calloc(1, sizeof(*base[n])))) {
-	e_outofmemory(ctx, FLINE);
+        e_outofmemory(ctx, FLINE);
         return 0;               /* not reached */
     }
 
@@ -737,18 +739,18 @@ static toml_array_t* create_array_in_array(context_t* ctx,
 /* Create a table in an array 
  */
 static toml_table_t* create_table_in_array(context_t* ctx,
-					   toml_array_t* parent)
+                                           toml_array_t* parent)
 {
     int n = parent->nelem;
     toml_table_t** base;
     if (0 == (base = (toml_table_t**) realloc(parent->u.tab, (n+1) * sizeof(*base)))) {
-	e_outofmemory(ctx, FLINE);
+        e_outofmemory(ctx, FLINE);
         return 0;               /* not reached */
     }
     parent->u.tab = base;
     
     if (0 == (base[n] = (toml_table_t*) calloc(1, sizeof(*base[n])))) {
-	e_outofmemory(ctx, FLINE);
+        e_outofmemory(ctx, FLINE);
         return 0;               /* not reached */
     }
 
@@ -772,28 +774,35 @@ static void parse_table(context_t* ctx, toml_table_t* tab)
     EAT_TOKEN(ctx, LBRACE);
 
     for (;;) {
-	SKIP_NEWLINES(ctx);
+		if (ctx->tok.tok == NEWLINE) {
+            e_syntax_error(ctx, ctx->tok.lineno, "newline not allowed in inline table");
+			return;				/* not reached */
+		}
 
-	/* until } */
-	if (ctx->tok.tok == RBRACE) break;
+        /* until } */
+        if (ctx->tok.tok == RBRACE) break;
 
-	if (ctx->tok.tok != STRING) {
+        if (ctx->tok.tok != STRING) {
             e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
             return;             /* not reached */
-	}
+        }
         parse_keyval(ctx, tab);
-	SKIP_NEWLINES(ctx);
+		
+		if (ctx->tok.tok == NEWLINE) {
+            e_syntax_error(ctx, ctx->tok.lineno, "newline not allowed in inline table");
+			return;				/* not reached */
+		}
 
-	/* on comma, continue to scan for next keyval */
-	if (ctx->tok.tok == COMMA) {
-	    EAT_TOKEN(ctx, COMMA);
-	    continue;
-	}
-	break;
+        /* on comma, continue to scan for next keyval */
+        if (ctx->tok.tok == COMMA) {
+            EAT_TOKEN(ctx, COMMA);
+            continue;
+        }
+        break;
     }
 
     if (ctx->tok.tok != RBRACE) {
-	e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
+        e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
         return;                 /* not reached */
     }
 
@@ -808,9 +817,9 @@ static int valtype(const char* val)
     if (0 == toml_rtoi(val, 0)) return 'i';
     if (0 == toml_rtod(val, 0)) return 'd';
     if (0 == toml_rtots(val, &ts)) {
-	if (ts.year && ts.hour) return 'T'; /* timestamp */
-	if (ts.year) return 'D'; /* date */
-	return 't'; /* time */
+        if (ts.year && ts.hour) return 'T'; /* timestamp */
+        if (ts.year) return 'D'; /* date */
+        return 't'; /* time */
     }
     return 'u'; /* unknown */
 }
@@ -822,94 +831,94 @@ static void parse_array(context_t* ctx, toml_array_t* arr)
     EAT_TOKEN(ctx, LBRACKET);
 
     for (;;) {
-	SKIP_NEWLINES(ctx);
-	
-	/* until ] */
-	if (ctx->tok.tok == RBRACKET) break;
-
-	switch (ctx->tok.tok) {
-	case STRING:
-	    {
-		char* val = ctx->tok.ptr;
-		int   vlen = ctx->tok.len;
-
-		/* set array kind if this will be the first entry */
-		if (arr->kind == 0) arr->kind = 'v';
-		/* check array kind */
-		if (arr->kind != 'v') {
-		    e_syntax_error(ctx, ctx->tok.lineno,
+        SKIP_NEWLINES(ctx);
+        
+        /* until ] */
+        if (ctx->tok.tok == RBRACKET) break;
+
+        switch (ctx->tok.tok) {
+        case STRING:
+            {
+                char* val = ctx->tok.ptr;
+                int   vlen = ctx->tok.len;
+
+                /* set array kind if this will be the first entry */
+                if (arr->kind == 0) arr->kind = 'v';
+                /* check array kind */
+                if (arr->kind != 'v') {
+                    e_syntax_error(ctx, ctx->tok.lineno,
                                    "a string array can only contain strings");
                     return;     /* not reached */
-		}
+                }
 
-		/* make a new value in array */
-		char** tmp = (char**) realloc(arr->u.val, (arr->nelem+1) * sizeof(*tmp));
-		if (!tmp) {
+                /* make a new value in array */
+                char** tmp = (char**) realloc(arr->u.val, (arr->nelem+1) * sizeof(*tmp));
+                if (!tmp) {
                     e_outofmemory(ctx, FLINE);
                     return;     /* not reached */
                 }
-		arr->u.val = tmp;
-		if (! (val = strndup(val, vlen))) {
+                arr->u.val = tmp;
+                if (! (val = strndup(val, vlen))) {
                     e_outofmemory(ctx, FLINE);
                     return;     /* not reached */
                 }
-		arr->u.val[arr->nelem++] = val;
+                arr->u.val[arr->nelem++] = val;
 
-		/* set array type if this is the first entry, or check that the types matched. */
-		if (arr->nelem == 1) 
-		    arr->type = valtype(arr->u.val[0]);
-		else if (arr->type != valtype(val)) {
-		    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
+                /* set array type if this is the first entry, or check that the types matched. */
+                if (arr->nelem == 1) 
+                    arr->type = valtype(arr->u.val[0]);
+                else if (arr->type != valtype(val)) {
+                    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
                     return;     /* not reached */
                 }
 
-		EAT_TOKEN(ctx, STRING);
-		break;
-	    }
-
-	case LBRACKET:
-	    { /* [ [array], [array] ... ] */
-		/* set the array kind if this will be the first entry */
-		if (arr->kind == 0) arr->kind = 'a';
-		/* check array kind */
-		if (arr->kind != 'a') {
-		    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
+                EAT_TOKEN(ctx, STRING);
+                break;
+            }
+
+        case LBRACKET:
+            { /* [ [array], [array] ... ] */
+                /* set the array kind if this will be the first entry */
+                if (arr->kind == 0) arr->kind = 'a';
+                /* check array kind */
+                if (arr->kind != 'a') {
+                    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
                     return;     /* not reached */
-		}
-		parse_array(ctx, create_array_in_array(ctx, arr));
-		break;
-	    }
-
-	case LBRACE:
-	    { /* [ {table}, {table} ... ] */
-		/* set the array kind if this will be the first entry */
-		if (arr->kind == 0) arr->kind = 't';
-		/* check array kind */
-		if (arr->kind != 't') {
-		    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
+                }
+                parse_array(ctx, create_array_in_array(ctx, arr));
+                break;
+            }
+
+        case LBRACE:
+            { /* [ {table}, {table} ... ] */
+                /* set the array kind if this will be the first entry */
+                if (arr->kind == 0) arr->kind = 't';
+                /* check array kind */
+                if (arr->kind != 't') {
+                    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
                     return;     /* not reached */
-		}
-		parse_table(ctx, create_table_in_array(ctx, arr));
-		break;
-	    }
-	    
-	default:
-	    e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
+                }
+                parse_table(ctx, create_table_in_array(ctx, arr));
+                break;
+            }
+            
+        default:
+            e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
             return;             /* not reached */
-	}
+        }
 
-	SKIP_NEWLINES(ctx);
+        SKIP_NEWLINES(ctx);
 
-	/* on comma, continue to scan for next element */
-	if (ctx->tok.tok == COMMA) {
-	    EAT_TOKEN(ctx, COMMA);
-	    continue;
-	}
-	break;
+        /* on comma, continue to scan for next element */
+        if (ctx->tok.tok == COMMA) {
+            EAT_TOKEN(ctx, COMMA);
+            continue;
+        }
+        break;
     }
 
     if (ctx->tok.tok != RBRACKET) {
-	e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
+        e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
         return;                 /* not reached */
     }
 
@@ -926,7 +935,7 @@ static void parse_array(context_t* ctx, toml_array_t* arr)
 static void parse_keyval(context_t* ctx, toml_table_t* tab)
 {
     if (ctx->tok.tok != STRING) {
-	e_internal_error(ctx, FLINE);
+        e_internal_error(ctx, FLINE);
         return;                 /* not reached */
     }
 
@@ -934,7 +943,7 @@ static void parse_keyval(context_t* ctx, toml_table_t* tab)
 
     EAT_TOKEN(ctx, STRING);
     if (ctx->tok.tok != EQUAL) {
-	e_syntax_error(ctx, ctx->tok.lineno, "missing =");
+        e_syntax_error(ctx, ctx->tok.lineno, "missing =");
         return;                 /* not reached */
     }
 
@@ -942,37 +951,37 @@ static void parse_keyval(context_t* ctx, toml_table_t* tab)
 
     switch (ctx->tok.tok) {
     case STRING:
-	{ /* key = "value" */
-	    toml_keyval_t* keyval = create_keyval_in_table(ctx, tab, key);
-	    token_t val = ctx->tok;
-	    assert(keyval->val == 0);
-	    keyval->val = strndup(val.ptr, val.len);
-	    if (! keyval->val) {
+        { /* key = "value" */
+            toml_keyval_t* keyval = create_keyval_in_table(ctx, tab, key);
+            token_t val = ctx->tok;
+            assert(keyval->val == 0);
+            keyval->val = strndup(val.ptr, val.len);
+            if (! keyval->val) {
                 e_outofmemory(ctx, FLINE);
                 return;         /* not reached */
             }
 
-	    EAT_TOKEN(ctx, STRING);
-	    
-	    return;
-	}
+            EAT_TOKEN(ctx, STRING);
+            
+            return;
+        }
 
     case LBRACKET:
-	{ /* key = [ array ] */
-	    toml_array_t* arr = create_keyarray_in_table(ctx, tab, key, 0);
-	    parse_array(ctx, arr);
-	    return;
-	}
+        { /* key = [ array ] */
+            toml_array_t* arr = create_keyarray_in_table(ctx, tab, key, 0);
+            parse_array(ctx, arr);
+            return;
+        }
 
     case LBRACE:
-	{ /* key = { table } */
-	    toml_table_t* nxttab = create_keytable_in_table(ctx, tab, key);
-	    parse_table(ctx, nxttab);
-	    return;
-	}
+        { /* key = { table } */
+            toml_table_t* nxttab = create_keytable_in_table(ctx, tab, key);
+            parse_table(ctx, nxttab);
+            return;
+        }
 
     default:
-	e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
+        e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
         return;                 /* not reached */
     }
 }
@@ -995,41 +1004,41 @@ static void fill_tabpath(context_t* ctx)
     
     /* clear tpath */
     for (i = 0; i < ctx->tpath.top; i++) {
-	char** p = &ctx->tpath.key[i];
-	xfree(*p);
-	*p = 0;
+        char** p = &ctx->tpath.key[i];
+        xfree(*p);
+        *p = 0;
     }
     ctx->tpath.top = 0;
     
     for (;;) {
-	if (ctx->tpath.top >= 10) {
-	    e_syntax_error(ctx, lineno, "table path is too deep; max allowed is 10.");
+        if (ctx->tpath.top >= 10) {
+            e_syntax_error(ctx, lineno, "table path is too deep; max allowed is 10.");
             return;             /* not reached */
         }
 
-	if (ctx->tok.tok != STRING) {
-	    e_syntax_error(ctx, lineno, "invalid or missing key");
+        if (ctx->tok.tok != STRING) {
+            e_syntax_error(ctx, lineno, "invalid or missing key");
             return;             /* not reached */
         }
 
-	ctx->tpath.tok[ctx->tpath.top] = ctx->tok;
-	ctx->tpath.key[ctx->tpath.top] = normalize_key(ctx, ctx->tok);
-	ctx->tpath.top++;
-	
-	next_token(ctx, 1);
+        ctx->tpath.tok[ctx->tpath.top] = ctx->tok;
+        ctx->tpath.key[ctx->tpath.top] = normalize_key(ctx, ctx->tok);
+        ctx->tpath.top++;
+        
+        next_token(ctx, 1);
 
-	if (ctx->tok.tok == RBRACKET) break;
+        if (ctx->tok.tok == RBRACKET) break;
 
-	if (ctx->tok.tok != DOT) {
-	    e_syntax_error(ctx, lineno, "invalid key");
+        if (ctx->tok.tok != DOT) {
+            e_syntax_error(ctx, lineno, "invalid key");
             return;             /* not reached */
         }
 
-	next_token(ctx, 1);
+        next_token(ctx, 1);
     }
 
     if (ctx->tpath.top <= 0) {
-	e_syntax_error(ctx, lineno, "empty table selector");
+        e_syntax_error(ctx, lineno, "empty table selector");
         return;                 /* not reached */
     }
 }
@@ -1044,63 +1053,63 @@ static void walk_tabpath(context_t* ctx)
     toml_table_t* curtab = ctx->root;
     
     for (int i = 0; i < ctx->tpath.top; i++) {
-	const char* key = ctx->tpath.key[i];
-
-	toml_keyval_t* nextval = 0;
-	toml_array_t* nextarr = 0;
-	toml_table_t* nexttab = 0;
-	switch (check_key(curtab, key, &nextval, &nextarr, &nexttab)) {
-	case 't':
-	    /* found a table. nexttab is where we will go next. */
-	    break;
-
-	case 'a':
-	    /* found an array. nexttab is the last table in the array. */
-	    if (nextarr->kind != 't') {
+        const char* key = ctx->tpath.key[i];
+
+        toml_keyval_t* nextval = 0;
+        toml_array_t* nextarr = 0;
+        toml_table_t* nexttab = 0;
+        switch (check_key(curtab, key, &nextval, &nextarr, &nexttab)) {
+        case 't':
+            /* found a table. nexttab is where we will go next. */
+            break;
+
+        case 'a':
+            /* found an array. nexttab is the last table in the array. */
+            if (nextarr->kind != 't') {
                 e_internal_error(ctx, FLINE);
                 return;         /* not reached */
             }
-	    if (nextarr->nelem == 0) {
+            if (nextarr->nelem == 0) {
                 e_internal_error(ctx, FLINE);
                 return;         /* not reached */
             }
-	    nexttab = nextarr->u.tab[nextarr->nelem-1];
-	    break;
+            nexttab = nextarr->u.tab[nextarr->nelem-1];
+            break;
 
-	case 'v':
-	    e_key_exists_error(ctx, ctx->tpath.tok[i]);
+        case 'v':
+            e_key_exists_error(ctx, ctx->tpath.tok[i]);
             return;             /* not reached */
 
-	default:
-	    { /* Not found. Let's create an implicit table. */
-		int n = curtab->ntab;
-		toml_table_t** base = (toml_table_t**) realloc(curtab->tab, (n+1) * sizeof(*base));
-		if (0 == base) {
+        default:
+            { /* Not found. Let's create an implicit table. */
+                int n = curtab->ntab;
+                toml_table_t** base = (toml_table_t**) realloc(curtab->tab, (n+1) * sizeof(*base));
+                if (0 == base) {
                     e_outofmemory(ctx, FLINE);
                     return;     /* not reached */
                 }
-		curtab->tab = base;
-		
-		if (0 == (base[n] = (toml_table_t*) calloc(1, sizeof(*base[n])))) {
-		    e_outofmemory(ctx, FLINE);
+                curtab->tab = base;
+                
+                if (0 == (base[n] = (toml_table_t*) calloc(1, sizeof(*base[n])))) {
+                    e_outofmemory(ctx, FLINE);
                     return;     /* not reached */
                 }
-		
-		if (0 == (base[n]->key = strdup(key))) {
-		    e_outofmemory(ctx, FLINE);
+                
+                if (0 == (base[n]->key = strdup(key))) {
+                    e_outofmemory(ctx, FLINE);
                     return;     /* not reached */
                 }
-		
-		nexttab = curtab->tab[curtab->ntab++];
-		
-		/* tabs created by walk_tabpath are considered implicit */
-		nexttab->implicit = 1;
-	    }
-	    break;
-	}
+                
+                nexttab = curtab->tab[curtab->ntab++];
+                
+                /* tabs created by walk_tabpath are considered implicit */
+                nexttab->implicit = 1;
+            }
+            break;
+        }
 
-	/* switch to next tab */
-	curtab = nexttab;
+        /* switch to next tab */
+        curtab = nexttab;
     }
 
     /* save it */
@@ -1111,16 +1120,18 @@ static void walk_tabpath(context_t* ctx)
 /* handle lines like [x.y.z] or [[x.y.z]] */
 static void parse_select(context_t* ctx)
 {
-    int count_lbracket = 0;
-    if (ctx->tok.tok != LBRACKET) {
-        e_internal_error(ctx, FLINE);
-        return;                 /* not reached */
-    }
-    count_lbracket++;
+    assert(ctx->tok.tok == LBRACKET);
+	
+	/* true if [[ */
+	int llb = (ctx->tok.ptr + 1 < ctx->stop && ctx->tok.ptr[1] == '[');
+	/* need to detect '[[' on our own because next_token() will skip whitespace, 
+	   and '[ [' would be taken as '[[', which is wrong. */
+
+	/* eat [ or [[ */
     next_token(ctx, 1 /* DOT IS SPECIAL */);
-    if (ctx->tok.tok == LBRACKET) {
-	count_lbracket++;
-	next_token(ctx, 1 /* DOT IS SPECIAL */);
+	if (llb) {
+		assert(ctx->tok.tok == LBRACKET);
+        next_token(ctx, 1 /* DOT IS SPECIAL */);
     }
 
     fill_tabpath(ctx);
@@ -1130,66 +1141,67 @@ static void parse_select(context_t* ctx)
     token_t z = ctx->tpath.tok[ctx->tpath.top-1];
     free(ctx->tpath.key[ctx->tpath.top-1]);
     ctx->tpath.top--;
-    
+
+	/* set up ctx->curtab */
     walk_tabpath(ctx);
 
-    if (count_lbracket == 1) {
-	/* [x.y.z] -> create z = {} in x.y */
-	ctx->curtab = create_keytable_in_table(ctx, ctx->curtab, z);
+    if (! llb) {
+        /* [x.y.z] -> create z = {} in x.y */
+        ctx->curtab = create_keytable_in_table(ctx, ctx->curtab, z);
     } else {
-	/* [[x.y.z]] -> create z = [] in x.y */
-	toml_array_t* arr = create_keyarray_in_table(ctx, ctx->curtab, z,
-						     1 /*skip_if_exist*/);
+        /* [[x.y.z]] -> create z = [] in x.y */
+        toml_array_t* arr = create_keyarray_in_table(ctx, ctx->curtab, z,
+                                                     1 /*skip_if_exist*/);
         if (!arr) {
             e_syntax_error(ctx, z.lineno, "key exists");
             return;
         }
-	if (arr->kind == 0) arr->kind = 't';
-	if (arr->kind != 't') {
+        if (arr->kind == 0) arr->kind = 't';
+        if (arr->kind != 't') {
             e_syntax_error(ctx, z.lineno, "array mismatch");
             return;             /* not reached */
         }
 
-	/* add to z[] */
-	toml_table_t* dest;
-	{
-	    int n = arr->nelem;
-	    toml_table_t** base = realloc(arr->u.tab, (n+1) * sizeof(*base));
-	    if (0 == base) {
+        /* add to z[] */
+        toml_table_t* dest;
+        {
+            int n = arr->nelem;
+            toml_table_t** base = realloc(arr->u.tab, (n+1) * sizeof(*base));
+            if (0 == base) {
                 e_outofmemory(ctx, FLINE);
                 return;         /* not reached */
             }
-	    arr->u.tab = base;
-	    
-	    if (0 == (base[n] = calloc(1, sizeof(*base[n])))) {
-		e_outofmemory(ctx, FLINE);
+            arr->u.tab = base;
+            
+            if (0 == (base[n] = calloc(1, sizeof(*base[n])))) {
+                e_outofmemory(ctx, FLINE);
                 return;         /* not reached */
             }
-	    
+            
             if (0 == (base[n]->key = strdup("__anon__"))) {
-		e_outofmemory(ctx, FLINE);
+                e_outofmemory(ctx, FLINE);
                 return;         /* not reached */
             }
-	    
-	    dest = arr->u.tab[arr->nelem++];
-	}
+            
+            dest = arr->u.tab[arr->nelem++];
+        }
 
-	ctx->curtab = dest;
+        ctx->curtab = dest;
     }
 
     if (ctx->tok.tok != RBRACKET) {
         e_syntax_error(ctx, ctx->tok.lineno, "expects ]");
         return;                 /* not reached */
     }
-    EAT_TOKEN(ctx, RBRACKET);
-
-    if (count_lbracket == 2) {
-	if (ctx->tok.tok != RBRACKET) {
+	if (llb) {
+		if (! (ctx->tok.ptr + 1 < ctx->stop && ctx->tok.ptr[1] == ']')) {
             e_syntax_error(ctx, ctx->tok.lineno, "expects ]]");
-            return;             /* not reached */
-        }
+			return; /* not reached */
+		}
+		EAT_TOKEN(ctx, RBRACKET);
+	}
 	EAT_TOKEN(ctx, RBRACKET);
-    }
+		
     if (ctx->tok.tok != NEWLINE) {
         e_syntax_error(ctx, ctx->tok.lineno, "extra chars after ] or ]]");
         return;                 /* not reached */
@@ -1200,8 +1212,8 @@ static void parse_select(context_t* ctx)
 
 
 toml_table_t* toml_parse(char* conf,
-			 char* errbuf,
-			 int errbufsz)
+                         char* errbuf,
+                         int errbufsz)
 {
     context_t ctx;
 
@@ -1233,39 +1245,39 @@ toml_table_t* toml_parse(char* conf,
     ctx.curtab = ctx.root;
 
     if (0 != setjmp(ctx.jmp)) {
-	// Got here from a long_jmp. Something bad has happened.
-	// Free resources and return error.
-	for (int i = 0; i < ctx.tpath.top; i++) xfree(ctx.tpath.key[i]);
-	toml_free(ctx.root);
-	return 0;
+        // Got here from a long_jmp. Something bad has happened.
+        // Free resources and return error.
+        for (int i = 0; i < ctx.tpath.top; i++) xfree(ctx.tpath.key[i]);
+        toml_free(ctx.root);
+        return 0;
     }
 
     /* Scan forward until EOF */
     for (token_t tok = ctx.tok; ! tok.eof ; tok = ctx.tok) {
-	switch (tok.tok) {
-	    
-	case NEWLINE:
-	    next_token(&ctx, 1);
-	    break;
-	    
-	case STRING:
-	    parse_keyval(&ctx, ctx.curtab);
-	    if (ctx.tok.tok != NEWLINE) {
+        switch (tok.tok) {
+            
+        case NEWLINE:
+            next_token(&ctx, 1);
+            break;
+            
+        case STRING:
+            parse_keyval(&ctx, ctx.curtab);
+            if (ctx.tok.tok != NEWLINE) {
                 e_syntax_error(&ctx, ctx.tok.lineno, "extra chars after value");
                 return 0;         /* not reached */
             }
 
-	    EAT_TOKEN(&ctx, NEWLINE);
-	    break;
-	    
-	case LBRACKET:  /* [ x.y.z ] or [[ x.y.z ]] */
-	    parse_select(&ctx);
-	    break;
-	    
-	default:
-	    snprintf(ctx.errbuf, ctx.errbufsz, "line %d: syntax error", tok.lineno);
-	    longjmp(ctx.jmp, 1);
-	}
+            EAT_TOKEN(&ctx, NEWLINE);
+            break;
+            
+        case LBRACKET:  /* [ x.y.z ] or [[ x.y.z ]] */
+            parse_select(&ctx);
+            break;
+            
+        default:
+            snprintf(ctx.errbuf, ctx.errbufsz, "line %d: syntax error", tok.lineno);
+            longjmp(ctx.jmp, 1);
+        }
     }
 
     /* success */
@@ -1275,8 +1287,8 @@ toml_table_t* toml_parse(char* conf,
 
 
 toml_table_t* toml_parse_file(FILE* fp,
-			      char* errbuf,
-			      int errbufsz)
+                              char* errbuf,
+                              int errbufsz)
 {
     int bufsz = 0;
     char* buf = 0;
@@ -1291,26 +1303,26 @@ toml_table_t* toml_parse_file(FILE* fp,
 
     /* read from fp into buf */
     while (! feof(fp)) {
-	bufsz += 1000;
-	
-	/* Allocate 1 extra byte because we will tag on a NUL */
-	char* x = realloc(buf, bufsz + 1);
-	if (!x) {
-	    snprintf(errbuf, errbufsz, "out of memory");
-	    xfree(buf);
-	    return 0;
-	}
-	buf = x;
-
-	errno = 0;
-	int n = fread(buf + off, 1, bufsz - off, fp);
-	if (ferror(fp)) {
-	    snprintf(errbuf, errbufsz, "%s",
-		     errno ? strerror(errno) : "Error reading file");
-	    free(buf);
-	    return 0;
-	}
-	off += n;
+        bufsz += 1000;
+        
+        /* Allocate 1 extra byte because we will tag on a NUL */
+        char* x = realloc(buf, bufsz + 1);
+        if (!x) {
+            snprintf(errbuf, errbufsz, "out of memory");
+            xfree(buf);
+            return 0;
+        }
+        buf = x;
+
+        errno = 0;
+        int n = fread(buf + off, 1, bufsz - off, fp);
+        if (ferror(fp)) {
+            snprintf(errbuf, errbufsz, "%s",
+                     errno ? strerror(errno) : "Error reading file");
+            free(buf);
+            return 0;
+        }
+        off += n;
     }
 
     /* tag on a NUL to cap the string */
@@ -1340,19 +1352,19 @@ static void xfree_arr(toml_array_t* p)
     xfree(p->key);
     switch (p->kind) {
     case 'v':
-	for (int i = 0; i < p->nelem; i++) xfree(p->u.val[i]);
-	xfree(p->u.val);
-	break;
+        for (int i = 0; i < p->nelem; i++) xfree(p->u.val[i]);
+        xfree(p->u.val);
+        break;
 
     case 'a':
-	for (int i = 0; i < p->nelem; i++) xfree_arr(p->u.arr[i]);
-	xfree(p->u.arr);
-	break;
+        for (int i = 0; i < p->nelem; i++) xfree_arr(p->u.arr[i]);
+        xfree(p->u.arr);
+        break;
 
     case 't':
-	for (int i = 0; i < p->nelem; i++) xfree_tab(p->u.tab[i]);
-	xfree(p->u.tab);
-	break;
+        for (int i = 0; i < p->nelem; i++) xfree_tab(p->u.tab[i]);
+        xfree(p->u.tab);
+        break;
     }
 
     xfree(p);
@@ -1410,94 +1422,94 @@ static tokentype_t scan_string(context_t* ctx, char* p, int lineno, int dotisspe
 {
     char* orig = p;
     if (0 == strncmp(p, "'''", 3)) {
-	p = strstr(p + 3, "'''");
-	if (0 == p) {
-	    e_syntax_error(ctx, lineno, "unterminated triple-s-quote");
+        p = strstr(p + 3, "'''");
+        if (0 == p) {
+            e_syntax_error(ctx, lineno, "unterminated triple-s-quote");
             return 0;           /* not reached */
         }
 
-	return ret_token(ctx, STRING, lineno, orig, p + 3 - orig);
+        return ret_token(ctx, STRING, lineno, orig, p + 3 - orig);
     }
 
     if (0 == strncmp(p, "\"\"\"", 3)) {
-	int hexreq = 0;		/* #hex required */
-	int escape = 0;
-	int qcnt = 0;		/* count quote */
-	for (p += 3; *p && qcnt < 3; p++) {
-	    if (escape) {
-		escape = 0;
-		if (strchr("btnfr\"\\", *p)) continue;
-		if (*p == 'u') { hexreq = 4; continue; }
-		if (*p == 'U') { hexreq = 8; continue; }
-		if (*p == '\n') continue; /* allow for line ending backslash */
-		e_syntax_error(ctx, lineno, "bad escape char");
+        int hexreq = 0;         /* #hex required */
+        int escape = 0;
+        int qcnt = 0;           /* count quote */
+        for (p += 3; *p && qcnt < 3; p++) {
+            if (escape) {
+                escape = 0;
+                if (strchr("btnfr\"\\", *p)) continue;
+                if (*p == 'u') { hexreq = 4; continue; }
+                if (*p == 'U') { hexreq = 8; continue; }
+                if (*p == '\n') continue; /* allow for line ending backslash */
+                e_syntax_error(ctx, lineno, "bad escape char");
                 return 0;       /* not reached */
-	    }
-	    if (hexreq) {
-		hexreq--;
-		if (strchr("0123456789ABCDEF", *p)) continue;
-		e_syntax_error(ctx, lineno, "expect hex char");
+            }
+            if (hexreq) {
+                hexreq--;
+                if (strchr("0123456789ABCDEF", *p)) continue;
+                e_syntax_error(ctx, lineno, "expect hex char");
                 return 0;       /* not reached */
-	    }
-	    if (*p == '\\') { escape = 1; continue; }
-	    qcnt = (*p == '"') ? qcnt + 1 : 0; 
-	}
-	if (qcnt != 3) {
-	    e_syntax_error(ctx, lineno, "unterminated triple-quote");
+            }
+            if (*p == '\\') { escape = 1; continue; }
+            qcnt = (*p == '"') ? qcnt + 1 : 0; 
+        }
+        if (qcnt != 3) {
+            e_syntax_error(ctx, lineno, "unterminated triple-quote");
             return 0;           /* not reached */
         }
 
-	return ret_token(ctx, STRING, lineno, orig, p - orig);
+        return ret_token(ctx, STRING, lineno, orig, p - orig);
     }
 
     if ('\'' == *p) {
-	for (p++; *p && *p != '\n' && *p != '\''; p++);
-	if (*p != '\'') {
-	    e_syntax_error(ctx, lineno, "unterminated s-quote");
+        for (p++; *p && *p != '\n' && *p != '\''; p++);
+        if (*p != '\'') {
+            e_syntax_error(ctx, lineno, "unterminated s-quote");
             return 0;           /* not reached */
         }
 
-	return ret_token(ctx, STRING, lineno, orig, p + 1 - orig);
+        return ret_token(ctx, STRING, lineno, orig, p + 1 - orig);
     }
 
     if ('\"' == *p) {
-	int hexreq = 0;		/* #hex required */
-	int escape = 0;
-	for (p++; *p; p++) {
-	    if (escape) {
-		escape = 0;
-		if (strchr("btnfr\"\\", *p)) continue;
-		if (*p == 'u') { hexreq = 4; continue; }
-		if (*p == 'U') { hexreq = 8; continue; }
-		e_syntax_error(ctx, lineno, "bad escape char");
+        int hexreq = 0;         /* #hex required */
+        int escape = 0;
+        for (p++; *p; p++) {
+            if (escape) {
+                escape = 0;
+                if (strchr("btnfr\"\\", *p)) continue;
+                if (*p == 'u') { hexreq = 4; continue; }
+                if (*p == 'U') { hexreq = 8; continue; }
+                e_syntax_error(ctx, lineno, "bad escape char");
                 return 0;       /* not reached */
-	    }
-	    if (hexreq) {
-		hexreq--;
-		if (strchr("0123456789ABCDEF", *p)) continue;
-		e_syntax_error(ctx, lineno, "expect hex char");
+            }
+            if (hexreq) {
+                hexreq--;
+                if (strchr("0123456789ABCDEF", *p)) continue;
+                e_syntax_error(ctx, lineno, "expect hex char");
                 return 0;       /* not reached */
-	    }
-	    if (*p == '\\') { escape = 1; continue; }
-	    if (*p == '\n') break;
-	    if (*p == '"') break;
-	}
-	if (*p != '"') {
-	    e_syntax_error(ctx, lineno, "unterminated quote");
+            }
+            if (*p == '\\') { escape = 1; continue; }
+            if (*p == '\n') break;
+            if (*p == '"') break;
+        }
+        if (*p != '"') {
+            e_syntax_error(ctx, lineno, "unterminated quote");
             return 0;           /* not reached */
         }
 
-	return ret_token(ctx, STRING, lineno, orig, p + 1 - orig);
+        return ret_token(ctx, STRING, lineno, orig, p + 1 - orig);
     }
 
     for ( ; *p && *p != '\n'; p++) {
-	int ch = *p;
-	if (ch == '.' && dotisspecial) break;
-	if ('A' <= ch && ch <= 'Z') continue;
-	if ('a' <= ch && ch <= 'z') continue;
-	if ('0' <= ch && ch <= '9') continue;
-	if (strchr("+-_.:", ch)) continue;
-	break;
+        int ch = *p;
+        if (ch == '.' && dotisspecial) break;
+        if ('A' <= ch && ch <= 'Z') continue;
+        if ('a' <= ch && ch <= 'z') continue;
+        if ('0' <= ch && ch <= '9') continue;
+        if (strchr("+-_.:", ch)) continue;
+        break;
     }
 
     return ret_token(ctx, STRING, lineno, orig, p - orig);
@@ -1512,36 +1524,36 @@ static tokentype_t next_token(context_t* ctx, int dotisspecial)
 
     /* eat this tok */
     for (i = 0; i < ctx->tok.len; i++) {
-	if (*p++ == '\n')
-	    lineno++;
+        if (*p++ == '\n')
+            lineno++;
     }
 
     /* make next tok */
     while (p < ctx->stop) {
-	/* skip comment. stop just before the \n. */
-	if (*p == '#') {
-	    for (p++; p < ctx->stop && *p != '\n'; p++);
-	    continue;
-	}
+        /* skip comment. stop just before the \n. */
+        if (*p == '#') {
+            for (p++; p < ctx->stop && *p != '\n'; p++);
+            continue;
+        }
 
-	if (dotisspecial && *p == '.')
-	    return ret_token(ctx, DOT, lineno, p, 1);
-	
-	switch (*p) {
-	case ',': return ret_token(ctx, COMMA, lineno, p, 1);
-	case '=': return ret_token(ctx, EQUAL, lineno, p, 1);
-	case '{': return ret_token(ctx, LBRACE, lineno, p, 1);
-	case '}': return ret_token(ctx, RBRACE, lineno, p, 1);
-	case '[': return ret_token(ctx, LBRACKET, lineno, p, 1);
-	case ']': return ret_token(ctx, RBRACKET, lineno, p, 1);
-	case '\n': return ret_token(ctx, NEWLINE, lineno, p, 1);
-	case '\r': case ' ': case '\t':
-	    /* ignore white spaces */
-	    p++;
-	    continue;
-	}
+        if (dotisspecial && *p == '.')
+            return ret_token(ctx, DOT, lineno, p, 1);
+        
+        switch (*p) {
+        case ',': return ret_token(ctx, COMMA, lineno, p, 1);
+        case '=': return ret_token(ctx, EQUAL, lineno, p, 1);
+        case '{': return ret_token(ctx, LBRACE, lineno, p, 1);
+        case '}': return ret_token(ctx, RBRACE, lineno, p, 1);
+        case '[': return ret_token(ctx, LBRACKET, lineno, p, 1);
+        case ']': return ret_token(ctx, RBRACKET, lineno, p, 1);
+        case '\n': return ret_token(ctx, NEWLINE, lineno, p, 1);
+        case '\r': case ' ': case '\t':
+            /* ignore white spaces */
+            p++;
+            continue;
+        }
 
-	return scan_string(ctx, p, lineno, dotisspecial);
+        return scan_string(ctx, p, lineno, dotisspecial);
     }
 
     return ret_eof(ctx, lineno);
@@ -1566,8 +1578,8 @@ const char* toml_raw_in(toml_table_t* tab, const char* key)
 {
     int i;
     for (i = 0; i < tab->nkval; i++) {
-	if (0 == strcmp(key, tab->kval[i]->key))
-	    return tab->kval[i]->val;
+        if (0 == strcmp(key, tab->kval[i]->key))
+            return tab->kval[i]->val;
     }
     return 0;
 }
@@ -1576,8 +1588,8 @@ toml_array_t* toml_array_in(toml_table_t* tab, const char* key)
 {
     int i;
     for (i = 0; i < tab->narr; i++) {
-	if (0 == strcmp(key, tab->arr[i]->key))
-	    return tab->arr[i];
+        if (0 == strcmp(key, tab->arr[i]->key))
+            return tab->arr[i];
     }
     return 0;
 }
@@ -1587,8 +1599,8 @@ toml_table_t* toml_table_in(toml_table_t* tab, const char* key)
 {
     int i;
     for (i = 0; i < tab->ntab; i++) {
-	if (0 == strcmp(key, tab->tab[i]->key))
-	    return tab->tab[i];
+        if (0 == strcmp(key, tab->tab[i]->key))
+            return tab->tab[i];
     }
     return 0;
 }
@@ -1596,9 +1608,9 @@ toml_table_t* toml_table_in(toml_table_t* tab, const char* key)
 const char* toml_raw_at(toml_array_t* arr, int idx)
 {
     if (arr->kind != 'v')
-	return 0;
+        return 0;
     if (! (0 <= idx && idx < arr->nelem))
-	return 0;
+        return 0;
     return arr->u.val[idx];
 }
 
@@ -1607,23 +1619,63 @@ char toml_array_kind(toml_array_t* arr)
     return arr->kind;
 }
 
+char toml_array_type(toml_array_t* arr)
+{
+    if (arr->kind != 'v')
+        return 0;
+
+    if (arr->nelem == 0)
+        return 0;
+
+    return arr->type;
+}
+
 
+int toml_array_nelem(toml_array_t* arr)
+{
+    return arr->nelem;
+}
+
+const char* toml_array_key(toml_array_t* arr)
+{
+  return arr ? arr->key : (const char*) NULL;
+}
+
+int toml_table_nkval(toml_table_t* tab)
+{
+  return tab->nkval;
+}
+
+int toml_table_narr(toml_table_t* tab)
+{
+  return tab->narr;
+}
+
+int toml_table_ntab(toml_table_t* tab)
+{
+  return tab->ntab;
+}
+
+const char* toml_table_key(toml_table_t* tab)
+{
+  return tab ? tab->key : (const char*) NULL;
+}
 
 toml_array_t* toml_array_at(toml_array_t* arr, int idx)
 {
     if (arr->kind != 'a')
-	return 0;
+        return 0;
     if (! (0 <= idx && idx < arr->nelem))
-	return 0;
+        return 0;
     return arr->u.arr[idx];
 }
 
 toml_table_t* toml_table_at(toml_array_t* arr, int idx)
 {
     if (arr->kind != 't')
-	return 0;
+        return 0;
     if (! (0 <= idx && idx < arr->nelem))
-	return 0;
+        return 0;
     return arr->u.tab[idx];
 }
 
@@ -1639,42 +1691,43 @@ int toml_rtots(const char* src_, toml_timestamp_t* ret)
     
     memset(ret, 0, sizeof(*ret));
 
-    /* parse date */
+    /* parse date YYYY-MM-DD */
     val = 0;
     if (q - p > 4 && p[4] == '-') {
-	for (i = 0; i < 10; i++, p++) {
-	    int xx = *p;
-	    if (xx == '-') {
-		if (i == 4 || i == 7) continue; else return -1;
-	    }
-	    if (! ('0' <= xx && xx <= '9')) return -1;
-	    val = val * 10 + (xx - '0');
-	}
-	ret->day   = &ret->__buffer.day;
-	ret->month = &ret->__buffer.month;
-	ret->year  = &ret->__buffer.year;
-	
-	*ret->day   = val % 100; val /= 100;
-	*ret->month = val % 100; val /= 100;
-	*ret->year  = val;
-	
-	if (*p) {
-	    if (*p != 'T') return -1;
-	    p++;
-	}
+        for (i = 0; i < 10; i++, p++) {
+            int xx = *p;
+            if (xx == '-') {
+                if (i == 4 || i == 7) continue; else return -1;
+            }
+            if (! ('0' <= xx && xx <= '9')) return -1;
+            val = val * 10 + (xx - '0');
+        }
+        ret->day   = &ret->__buffer.day;
+        ret->month = &ret->__buffer.month;
+        ret->year  = &ret->__buffer.year;
+        
+        *ret->day   = val % 100; val /= 100;
+        *ret->month = val % 100; val /= 100;
+        *ret->year  = val;
+        
+        if (*p) {
+            // parse the T or space separator
+            if (*p != 'T' && *p != ' ') return -1;
+            p++;
+        }
     }
     if (q == p) return 0;
 
-    /* parse time */
+    /* parse time HH:MM:SS */
     val = 0;
     if (q - p < 8) return -1;
     for (i = 0; i < 8; i++, p++) {
-	int xx = *p;
-	if (xx == ':') {
-	    if (i == 2 || i == 5) continue; else return -1;
-	}
-	if (! ('0' <= xx && xx <= '9')) return -1;
-	val = val * 10 + (xx - '0');
+        int xx = *p;
+        if (xx == ':') {
+            if (i == 2 || i == 5) continue; else return -1;
+        }
+        if (! ('0' <= xx && xx <= '9')) return -1;
+        val = val * 10 + (xx - '0');
     }
     ret->second = &ret->__buffer.second;
     ret->minute = &ret->__buffer.minute;
@@ -1684,34 +1737,48 @@ int toml_rtots(const char* src_, toml_timestamp_t* ret)
     *ret->minute = val % 100; val /= 100;
     *ret->hour   = val;
     
-    /* skip fractional second */
-    if (*p == '.') for (p++; '0' <= *p && *p <= '9'; p++);
+    /* parse millisec */
+    if (*p == '.') {
+		val = 0;
+		p++;
+		if ('0' <= *p && *p <= '9') {
+			val = (*p++ - '0') * 100;
+			if ('0' <= *p && *p <= '9') {
+				val += (*p++ - '0') * 10;
+				if ('0' <= *p && *p <= '9') {
+					val += (*p++ - '0');
+				}
+			}
+		}
+		ret->millisec = &ret->__buffer.millisec;
+		*ret->millisec = val;
+	}
     if (q == p) return 0;
     
     /* parse and copy Z */
     ret->z = ret->__buffer.z;
     char* z = ret->z;
     if (*p == 'Z') {
-	*z++ = *p++;
-	*z = 0;
-	return (p == q) ? 0 : -1;
+        *z++ = *p++;
+        *z = 0;
+        return (p == q) ? 0 : -1;
     }
     if (*p == '+' || *p == '-') {
-	*z++ = *p++;
-	
-	if (! (isdigit(p[0]) && isdigit(p[1]))) return -1;
-	*z++ = *p++;
-	*z++ = *p++;
-	
-	if (*p == ':') {
-	    *z++ = *p++;
-	    
-	    if (! (isdigit(p[0]) && isdigit(p[1]))) return -1;
-	    *z++ = *p++;
-	    *z++ = *p++;
-	}
-	
-	*z = 0;
+        *z++ = *p++;
+        
+        if (! (isdigit(p[0]) && isdigit(p[1]))) return -1;
+        *z++ = *p++;
+        *z++ = *p++;
+        
+        if (*p == ':') {
+            *z++ = *p++;
+            
+            if (! (isdigit(p[0]) && isdigit(p[1]))) return -1;
+            *z++ = *p++;
+            *z++ = *p++;
+        }
+        
+        *z = 0;
     }
     return (p == q) ? 0 : -1;
 }
@@ -1725,12 +1792,12 @@ int toml_rtob(const char* src, int* ret_)
     int* ret = ret_ ? ret_ : &dummy;
     
     if (0 == strcmp(src, "true")) {
-	*ret = 1;
-	return 0;
+        *ret = 1;
+        return 0;
     }
     if (0 == strcmp(src, "false")) {
-	*ret = 0;
-	return 0;
+        *ret = 0;
+        return 0;
     }
     return -1;
 }
@@ -1745,27 +1812,49 @@ int toml_rtoi(const char* src, int64_t* ret_)
     char* p = buf;
     char* q = p + sizeof(buf);
     const char* s = src;
+    int base = 0;
     int64_t dummy;
     int64_t* ret = ret_ ? ret_ : &dummy;
     
-    if (*s == '+')
-	*p++ = *s++;
-    else if (*s == '-')
-	*p++ = *s++;
+
+    /* allow +/- */
+	if (s[0] == '+' || s[0] == '-')
+		*p++ = *s++;
+	
+	/* disallow +_100 */
+	if (s[0] == '_')
+		return -1;
 
     /* if 0 ... */
     if ('0' == s[0]) {
-	/* ensure no other digits after it */
-	if (s[1]) return -1;
-	return *ret = 0, 0;
+        switch (s[1]) {
+        case 'x': base = 16; s += 2; break;
+        case 'o': base = 8; s += 2; break;
+        case 'b': base = 2; s += 2; break;
+        case '\0': return *ret = 0, 0;
+        default:
+            /* ensure no other digits after it */
+            if (s[1]) return -1;
+        }
     }
 
     /* just strip underscores and pass to strtoll */
     while (*s && p < q) {
-	int ch = *s++;
-	if (ch == '_') ; else *p++ = ch;
+        int ch = *s++;
+		switch (ch) {
+		case '_':
+			// disallow '__'
+			if (s[0] == '_') return -1; 
+			continue; 			/* skip _ */
+		default:
+			break;
+		}
+        *p++ = ch;
     }
     if (*s || p == q) return -1;
+
+	/* last char cannot be '_' */
+	if (s[-1] == '_') return -1;
     
     /* cap with NUL */
     *p = 0;
@@ -1773,39 +1862,62 @@ int toml_rtoi(const char* src, int64_t* ret_)
     /* Run strtoll on buf to get the integer */
     char* endp;
     errno = 0;
-    *ret = strtoll(buf, &endp, 0);
+    *ret = strtoll(buf, &endp, base);
     return (errno || *endp) ? -1 : 0;
 }
 
 
-int toml_rtod(const char* src, double* ret_)
+int toml_rtod_ex(const char* src, double* ret_, char* buf, int buflen)
 {
     if (!src) return -1;
     
-    char buf[100];
     char* p = buf;
-    char* q = p + sizeof(buf);
+    char* q = p + buflen;
     const char* s = src;
     double dummy;
     double* ret = ret_ ? ret_ : &dummy;
+	
+
+    /* allow +/- */
+	if (s[0] == '+' || s[0] == '-')
+		*p++ = *s++;
+
+	/* disallow +_1.00 */
+	if (s[0] == '_')
+		return -1;
 
-    /* check for special cases */
-    if (s[0] == '+' || s[0] == '-') *p++ = *s++;
-    if (s[0] == '.') return -1;	/* no leading zero */
-    if (s[0] == '0') {
+	/* disallow +.99 */
+	if (s[0] == '.')
+		return -1;
+		
 	/* zero must be followed by . or NUL */
-	if (s[1] && s[1] != '.') return -1;
-    }
+	if (s[0] == '0' && s[1] && s[1] != '.')
+		return -1;
 
     /* just strip underscores and pass to strtod */
     while (*s && p < q) {
-	int ch = *s++;
-	if (ch == '_') ; else *p++ = ch;
+        int ch = *s++;
+		switch (ch) {
+		case '.':
+			if (s[-2] == '_') return -1;
+			if (s[0] == '_') return -1;
+			break;
+		case '_':
+			// disallow '__'
+			if (s[0] == '_') return -1; 
+			continue;			/* skip _ */
+		default:
+			break;
+		}
+        *p++ = ch;
     }
-    if (*s || p == q) return -1;
+    if (*s || p == q) return -1; /* reached end of string or buffer is full? */
+	
+	/* last char cannot be '_' */
+	if (s[-1] == '_') return -1;
 
     if (p != buf && p[-1] == '.') 
-	return -1; /* no trailing zero */
+        return -1; /* no trailing zero */
 
     /* cap with NUL */
     *p = 0;
@@ -1817,6 +1929,12 @@ int toml_rtod(const char* src, double* ret_)
     return (errno || *endp) ? -1 : 0;
 }
 
+int toml_rtod(const char* src, double* ret_)
+{
+	char buf[100];
+	return toml_rtod_ex(src, ret_, buf, sizeof(buf));
+}
+
 
 static char* kill_line_ending_backslash(char* str)
 {
@@ -1825,16 +1943,16 @@ static char* kill_line_ending_backslash(char* str)
     /* first round: find (backslash, \n) */
     char* p = str;
     while (0 != (p = strstr(p, "\\\n"))) {
-	char* q = (p + 1);
-	q += strspn(q, " \t\r\n");
-	memmove(p, q, strlen(q) + 1);
+        char* q = (p + 1);
+        q += strspn(q, " \t\r\n");
+        memmove(p, q, strlen(q) + 1);
     }
     /* second round: find (backslash, \r, \n) */
     p = str;
     while (0 != (p = strstr(p, "\\\r\n"))) {
-	char* q = (p + 1);
-	q += strspn(q, " \t\r\n");
-	memmove(p, q, strlen(q) + 1);
+        char* q = (p + 1);
+        q += strspn(q, " \t\r\n");
+        memmove(p, q, strlen(q) + 1);
     }
 
     return str;
@@ -1849,55 +1967,55 @@ int toml_rtos(const char* src, char** ret)
     *ret = 0;
     int srclen = strlen(src);
     if (*src == '\'') {
-	if (0 == strncmp(src, "'''", 3)) {
-	    const char* sp = src + 3;
-	    const char* sq = src + srclen - 3;
-	    /* last 3 chars in src must be ''' */
-	    if (! (sp <= sq && 0 == strcmp(sq, "'''")))
-		return -1;
-	    
-	    /* skip first new line right after ''' */
-	    if (*sp == '\n')
-		sp++;
-	    else if (sp[0] == '\r' && sp[1] == '\n')
-		sp += 2;
-
-	    *ret = kill_line_ending_backslash(strndup(sp, sq - sp));
-	} else {
-	    const char* sp = src + 1;
-	    const char* sq = src + srclen - 1;
-	    /* last char in src must be ' */
-	    if (! (sp <= sq && *sq == '\''))
-		return -1;
-	    /* copy from sp to p */
-	    *ret = strndup(sp, sq - sp);
-	}
-	return *ret ? 0 : -1;
+        if (0 == strncmp(src, "'''", 3)) {
+            const char* sp = src + 3;
+            const char* sq = src + srclen - 3;
+            /* last 3 chars in src must be ''' */
+            if (! (sp <= sq && 0 == strcmp(sq, "'''")))
+                return -1;
+            
+            /* skip first new line right after ''' */
+            if (*sp == '\n')
+                sp++;
+            else if (sp[0] == '\r' && sp[1] == '\n')
+                sp += 2;
+
+            *ret = kill_line_ending_backslash(strndup(sp, sq - sp));
+        } else {
+            const char* sp = src + 1;
+            const char* sq = src + srclen - 1;
+            /* last char in src must be ' */
+            if (! (sp <= sq && *sq == '\''))
+                return -1;
+            /* copy from sp to p */
+            *ret = strndup(sp, sq - sp);
+        }
+        return *ret ? 0 : -1;
     }
 
     const char* sp;
     const char* sq;
     if (0 == strncmp(src, "\"\"\"", 3)) {
-	sp = src + 3;
-	sq = src + srclen - 3;
-	if (! (sp <= sq && 0 == strcmp(sq, "\"\"\"")))
-	    return -1;
-	
-	/* skip first new line right after """ */
-	if (*sp == '\n')
-	    sp++;
-	else if (sp[0] == '\r' && sp[1] == '\n')
-	    sp += 2;
+        sp = src + 3;
+        sq = src + srclen - 3;
+        if (! (sp <= sq && 0 == strcmp(sq, "\"\"\"")))
+            return -1;
+        
+        /* skip first new line right after """ */
+        if (*sp == '\n')
+            sp++;
+        else if (sp[0] == '\r' && sp[1] == '\n')
+            sp += 2;
     } else {
-	sp = src + 1;
-	sq = src + srclen - 1;
-	if (! (sp <= sq && *sq == '"'))
-	    return -1;
+        sp = src + 1;
+        sq = src + srclen - 1;
+        if (! (sp <= sq && *sq == '"'))
+            return -1;
     }
 
     char dummy_errbuf[1];
     *ret = normalize_string(sp, sq - sp,
-			    1, // flag kill_line_ending_backslash 
-			    dummy_errbuf, sizeof(dummy_errbuf));
+                            1, // flag kill_line_ending_backslash 
+                            dummy_errbuf, sizeof(dummy_errbuf));
     return *ret ? 0 : -1;
 }
diff --git a/utils/common/toml.h b/utils/common/toml.h
index 54c1c825..6f239887 100644
--- a/utils/common/toml.h
+++ b/utils/common/toml.h
@@ -1,7 +1,7 @@
 /*
 MIT License
 
-Copyright (c) 2017 CK Tan
+Copyright (c) 2017 - 2019 CK Tan
 https://github.com/cktan/tomlc99
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
@@ -25,6 +25,11 @@ SOFTWARE.
 #ifndef TOML_H
 #define TOML_H
 
+
+#include <stdio.h>
+#include <stdint.h>
+
+
 #ifdef __cplusplus
 #define TOML_EXTERN extern "C"
 #else
@@ -38,16 +43,16 @@ typedef struct toml_array_t toml_array_t;
  * Caller must toml_free(the-return-value) after use.
  */
 TOML_EXTERN toml_table_t* toml_parse_file(FILE* fp, 
-					  char* errbuf,
-					  int errbufsz);
+                                          char* errbuf,
+                                          int errbufsz);
 
 /* Parse a string containing the full config. 
  * Return a table on success, or 0 otherwise.
  * Caller must toml_free(the-return-value) after use.
  */
 TOML_EXTERN toml_table_t* toml_parse(char* conf, /* NUL terminated, please. */
-				     char* errbuf,
-				     int errbufsz);
+                                     char* errbuf,
+                                     int errbufsz);
 
 /* Free the table returned by toml_parse() or toml_parse_file(). */
 TOML_EXTERN void toml_free(toml_table_t* tab);
@@ -63,6 +68,31 @@ TOML_EXTERN toml_table_t* toml_table_in(toml_table_t* tab, const char* key);
 /* Return the array kind: 't'able, 'a'rray, 'v'alue */
 TOML_EXTERN char toml_array_kind(toml_array_t* arr);
 
+/* For array kind 'v'alue, return the type of values 
+   i:int, d:double, b:bool, s:string, t:time, D:date, T:timestamp
+   0 if unknown
+*/
+TOML_EXTERN char toml_array_type(toml_array_t* arr);
+
+
+/* Return the number of elements in the array */
+TOML_EXTERN int toml_array_nelem(toml_array_t* arr);
+
+/* Return the key of an array */
+TOML_EXTERN const char* toml_array_key(toml_array_t* arr);
+
+/* Return the number of key-values in a table */
+TOML_EXTERN int toml_table_nkval(toml_table_t* tab);
+
+/* Return the number of arrays in a table */
+TOML_EXTERN int toml_table_narr(toml_table_t* tab);
+
+/* Return the number of sub-tables in a table */
+TOML_EXTERN int toml_table_ntab(toml_table_t* tab);
+
+/* Return the key of a table*/
+TOML_EXTERN const char* toml_table_key(toml_table_t* tab);
+
 /* Deref array by index. Return the element at idx or 0 if out of range. */
 TOML_EXTERN const char* toml_raw_at(toml_array_t* arr, int idx);
 TOML_EXTERN toml_array_t* toml_array_at(toml_array_t* arr, int idx);
@@ -82,6 +112,8 @@ TOML_EXTERN int toml_rtoi(const char* s, int64_t* ret);
 
 /* Raw to Double. Return 0 on success, -1 otherwise. */
 TOML_EXTERN int toml_rtod(const char* s, double* ret);
+/* Same as toml_rtod, but return the sanitized double in string form as well */
+TOML_EXTERN int toml_rtod_ex(const char* s, double* ret, char* buf, int buflen);
 
 /* Timestamp types. The year, month, day, hour, minute, second, z 
  * fields may be NULL if they are not relevant. e.g. In a DATE
@@ -90,12 +122,12 @@ TOML_EXTERN int toml_rtod(const char* s, double* ret);
 typedef struct toml_timestamp_t toml_timestamp_t;
 struct toml_timestamp_t {
     struct { /* internal. do not use. */
-	int year, month, day;
-	int hour, minute, second;
-	char z[10];
+        int year, month, day;
+        int hour, minute, second, millisec;
+        char z[10];
     } __buffer;
     int *year, *month, *day;
-    int *hour, *minute, *second;
+    int *hour, *minute, *second, *millisec;
     char* z;
 };
 
-- 
2.21.0

